'''
 * @file NV10PY.pyx
 * @author Oscar Pineda (o.pineda@coink.com)
 * @brief Interfaz en Cython de las funciones en C++
 * @version 0.1
 * @date 2023-05-02
 * 
 * @copyright Copyright (c) 2023
 * 
'''
cimport cython
from libcpp cimport bool
from libcpp.string cimport string
from libcpp.vector cimport vector

from time import sleep
import serial  

cdef struct SpdlogLevels_t:
    int Code;
    string Message;

cdef struct Bills_t:
    int Channel;
    int Bill;

cdef struct ErrorCodes_t:
    int Code;
    string Message;

cdef extern from "ValidatorNV10.hpp" namespace "ValidatorNV10":
    cdef cppclass NV10Class:
        NV10Class() except +
        int SerialPort;
        bool SuccessConnect;
        int LoggerLevel;
        int PortO;
        int PrevResponseSeq;
        int LengthData;
        int ErrorOCode;
        const char * ErrorOMsg;
        int EventOCode;
        const char * EventOMsg;
        int LROCode;
        const char * LROMsg;
        int Bill;
        int AdEventOCode;
        const char * AdEventOMsg;
        # --------------- LOGGER FUNCTIONS --------------------
        SpdlogLevels_t SearchSpdlogLevel(int Code);
        void SetSpdlogLevel();
        # --------------- SEARCH FUNCTIONS --------------------
        ErrorCodes_t SearchErrorCodeExComm (int Code);
        Bills_t SearchBill (int Channel);
        ErrorCodes_t SearchErrorCodes (int Code);
        ErrorCodes_t SearchEventCodes (int Code);
        ErrorCodes_t SearchLastReject (int Code);

        # --------------- STATES OF MACHINE STATE (FUNCTIONS) --------------------
        int StIdle();
        int StConnect();
        int StDisable();
        int StEnable();
        int StPolling();
        int StCheck();
        int StError();
        # --------------- MAIN FUNCTIONS --------------------
        int ConnectSerial(int Port);
        int ScanPorts();
        int SendingCommand(vector[unsigned char] Comm);
        int GetSeq();
        vector[unsigned char] CalcCRC(vector[unsigned char] command);
        vector[unsigned char] BuildCmd(vector[unsigned char] Comm);
        int ExecuteCommand(vector[unsigned char] Comm);
        int HandleResponse(vector[unsigned char] Response);
        int HandleEvent(vector[unsigned char] Response);
        int HandleLRC(vector[unsigned char] Response);
        int HandleChannel(vector[unsigned char] Response);
        int HandleCode(vector[unsigned char] Response);
        int DisplayOn();
        int DisplayOff();
        int SetChannels();
        int Enable();
        int Disable();
        int Poll();
        int LastReject();
        int Sync();

cdef enum State_t:
    ST_IDLE,
    ST_CONNECT,
    ST_DISABLE, 
    ST_ENABLE,
    ST_POLLING,
    ST_CHECK,
    ST_ERROR 

cdef struct StateMachine_t:
    State_t CurrState

cdef enum Event_t:
    EV_ANY,
    EV_SUCCESS_CONN,
    EV_CALL_POLLING,
    EV_CHECK,
    EV_READY,
    EV_FINISH_POLL,
    EV_POLL,
    EV_LOOP,
    EV_RESET,
    EV_ERROR

cdef extern from "StateMachine.hpp" namespace "StateMachine":
    cdef cppclass SMClass:

        enum State_t:
            ST_IDLE,
            ST_CONNECT,
            ST_DISABLE, 
            ST_ENABLE,
            ST_POLLING,
            ST_CHECK,
            ST_ERROR 

        struct StateMachine_t:
            State_t CurrState

        enum Event_t:
            EV_ANY,
            EV_SUCCESS_CONN,
            EV_CALL_POLLING,
            EV_CHECK,
            EV_READY,
            EV_FINISH_POLL,
            EV_POLL,
            EV_LOOP,
            EV_RESET,
            EV_ERROR

        SMClass(NV10Class*) except +
        StateMachine_t SM
        Event_t Evento
        State_t Estado
        void InitStateMachine()
        int StateMachineRun(Event_t Event)
        const char * StateMachineGetStateName(State_t State)

cdef class NV10CPP():

    # Apuntador a la clase definida en ValidatorNV10.cpp    
    cdef NV10Class *NV10_ptr

    # Apuntador a la clase definida en StateMachine.cpp
    cdef SMClass *SM_ptr

    cdef SMClass.Event_t Evento
    cdef SMClass.State_t Estado

    def __cinit__(self):
        # Creacion de un objeto de tipo NV10Class (Clase en ValidatorNV10.cpp)
        self.NV10_ptr = new NV10Class()

        #Nivel de logging de la libreria Spdlog
        #self.NV10_ptr.LoggerLevel = 1

        # Creacion de un objeto de tipo SMClass (Clase en StateMachine.cpp) y que recibe un apuntador de clase
        self.SM_ptr = new SMClass(self.NV10_ptr)
        self.Evento = EV_ANY
        self.Estado = ST_IDLE
        self.SM_ptr.SM.CurrState = self.Estado

    # Llama a la funcion que incializa la maquina de estados en C++
    def InitStateMachine(self):
        self.SM_ptr.InitStateMachine()

    # Llama a la funcion que corre la maquina de estados en C++
    def RunSM(self):
        return self.SM_ptr.StateMachineRun(self.Evento)

    # Obtiene el nombre del estado actual de la maquina de estados
    def GetNameSM(self):
        return self.SM_ptr.StateMachineGetStateName(self.SM_ptr.SM.CurrState)

    # Establece el evento encargado de cambiar el estado
    def SetEvent(self,Evento):
        self.Evento = Evento

    # Devuelve el estado de la bandera que indica si el validador esta conectado al puerto serial
    def IsConnected(self):
        return self.NV10_ptr.SuccessConnect

    # Establece el nivel de loggeo de la libreria spdlog
    #def SetSpdlogLevel(self,SPLevel):
    #    self.NV10_ptr.LoggerLevel = SPLevel
    #    self.NV10_ptr.SetSpdlogLevel()

    # Devuelve el puerto actual en donde esta conectado el validador
    def PortValidator(self):
        return self.NV10_ptr.PortO 

    # Devuelve la ultima secuencia de respuesta del billetero
    def PrevResponseSeq(self):
        return self.NV10_ptr.PrevResponseSeq

    # Devuelve la cantidad de datos de respuesta que devuelve el billetero
    def LengthData(self):
        return self.NV10_ptr.LengthData 

    # Devuelve el codigo de error que retornan los comandos de C++
    def RetErrCommand(self):
        try:
            EC = self.NV10_ptr.ErrorOCode
            EM = self.NV10_ptr.ErrorOMsg
            return(EC,EM)
        except:
            EC = ''
            EM = ''
            return(EC,EM)
    
    # Devuelve el evento actual en el que se encuentra el billetero (Cuando esta en polling)
    def RetEventCode(self):
        try:
            EC = self.NV10_ptr.EventOCode
            EM = self.NV10_ptr.EventOMsg
            return(EC,EM)
        except:
            EC = ''
            EM = ''
            return(EC,EM)

    # Devuelve el ultimo codigo de rechazo cuando estaba corriendo polling
    def RetLastRejectCode(self):
        try:
            LC = self.NV10_ptr.LROCode
            LM = self.NV10_ptr.LROMsg
            return(LC,LM)
        except:
            LC = ''
            LM = ''
            return(LC,LM)
    
    # Devuelve el ultimo evento adicional que devuelve cuando el estado es credit
    def RetAdEventCode(self):
        try:
            AC = self.NV10_ptr.AdEventOCode
            AM = self.NV10_ptr.AdEventOMsg
            return(AC,AM)
        except:
            AC = ''
            AM = ''
            return(AC,AM)

    def Bill(self):
        return self.NV10_ptr.Bill

class NV10PY(object):

    def __init__(self, LogLvl):

        try:
            Device = "/dev/ttyACM0"
            self.ser = serial.Serial(Device, 9600, timeout=1)
            self.ser.close()
        except:
            self.ser = None

        try:
            Device = "/dev/ttyACM1"
            self.ser = serial.Serial(Device, 9600, timeout=1)
            self.ser.close()
        except:
            self.ser = None

        try:
            Device = "/dev/ttyACM2"
            self.ser = serial.Serial(Device, 9600, timeout=1)
            self.ser.close()
        except:
            self.ser = None

        try:
            Device = "/dev/ttyACM3"
            self.ser = serial.Serial(Device, 9600, timeout=1)
            self.ser.close()
        except:
            self.ser = None

        self.Eventos = {
            'EV_ANY':0,
            'EV_SUCCESS_CONN':1,
            'EV_CALL_POLLING':2,
            'EV_CHECK':3,
            'EV_READY':4,
            'EV_FINISH_POLL':5,
            'EV_POLL':6,
            'EV_LOOP':7,
            'EV_RESET':8,
            'EV_ERROR':9
        }

        self.StateName = b'ST_IDLE'
        self.NV10CPP = NV10CPP()

        #self.NV10CPP.SetSpdlogLevel(LogLvl)

        self.NV10CPP.InitStateMachine()

    def SendEventRunSM(self,Event_str):
    
        self.NV10CPP.SetEvent(self.Eventos.get(Event_str))
        Response = self.NV10CPP.RunSM()
        self.StateName = self.NV10CPP.GetNameSM()

        return Response