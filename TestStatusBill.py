import serial
from time import sleep
import signal
import sys

class CompleteTest(object):

    def __init__(self):

        self.ser = None
        self.opcion = 0
        self.puerto = 0
        self.act_sequence = False
        self.act_event = 0

        self.MAXPORTS = 10
        self.BYTE_START = 0X7F

        self.Map_error = {
            240: 'OK',
            242: 'COMMAND NOT KNOWN',
            243: 'WRONG NO PARAMETERS',
            244: 'PARAMETER OUT OF RANGE',
            245: 'COMMAND CANNOT BE PROCESSED',
            246: 'SOFTWARE ERROR',
            248: 'FAIL',
            250: 'KEY NOT SET',
        }

        self.Map_events = {
            # No params
            240: 'OK',
            # 1 params
            181: 'CHANNELS_DISABLED',
            182: 'INITIALIZING',
            204: 'STACKING', 
            231: 'STACKER_FULL',
            232: 'DISABLED',
            233: 'UNSAFE JAM',
            234: 'SAFE JAM',
            235: 'STACKED',
            236: 'REJECTED', 
            237: 'REJECTING', 
            241: 'SLAVE_RESET', 
            # 2 params (Channel is the second)
            225: 'CLEARED_FROM_FRONT',
            226: 'CLEARED_TO_CASH_BOX',
            230: 'FRAUD ATTEMPT',
            239: 'READ', 
            # 3 params (Channel is the second, Event is the third)
            238: 'CREDIT',
        }

        self.Bills = {
            1: 1000,
            2: 2000,
            3: 5000,
            4: 10000,
            5: 20000,
            6: 50000,
            7: 100000
        }

        signal.signal(signal.SIGINT, self.signal_handler)

        self.main()
    
    def main(self):

        Flag = False

        #Flag = self.Check_Process()

        if(Flag):
            print("")
            print("Por favor detenga el proceso del oink para poder correr este Script")
            print("    - Para All in One, el proceso se detiene buscandolo y eliminandolo con el comando htop")
            print("    - Para Raspberry, el proceso se detiene corriendo: sudo systemctl stop oink")
            print("")
            return 1

        print("/------------------------------------------------------------------------/")
        print("Test para el validador de billetes")
        print("/------------------------------------------------------------------------/")
        print("Opcion 0.")
        print("/------------------------------------------------------------------------/")
        print("Cual opcion desea correr? (0-12)")

        try:
            self.opcion = int(input())
            if ((self.opcion >= 0) & (self.opcion <= 5)):
                pass
            else:
                print("Opcion invalida, ingrese un numero entre 0 y 5")
                return 1    
        except:
            print("Opcion invalida, ingrese un numero entero")
            return 1

        res = self.ScanPorts()

        if (res):
            print("Escaneo de puertos fue exitoso, corriendo reset")

            print(self.opcion1())
            print(self.opcion2())
            print(self.opcion3())

        else:
            print("Escaneo de puertos fallido, terminando test")
        
        self.ser.close()

    def ScanPorts(self):
        self.ser = None
        res = -1
        i=0
        while (i<self.MAXPORTS):
            try:
                self.ser = serial.Serial("/dev/ttyACM"+str(i),9600,timeout=1)
                res = self.sync()
                if (res):
                    print("Se encontro el puerto, es /dev/ttyACM",i)
                    self.puerto = i
                    i = self.MAXPORTS
                    return True
                else:
                    i = i + 1
            except Exception as e:
                print("El puerto no esta disponible",e)
                i = i + 1
        return False

    def Check_Process(self):
        
        import subprocess
        import os

        Flag = False

        with open("output.txt", "w") as f:
            subprocess.run("ps aux | grep runserver", shell=True, stdout=f)

        with open("output.txt", "r") as f:
            content = f.read()

        if "manage.py" in content:
            Flag = True
        else:
            Flag = False

        if os.path.exists("output.txt"):
            os.remove("output.txt")

        return Flag

    def signal_handler(self,signal,frame):

        print('Ctrl+C Detectado, cerrando el proceso')

        self.ser.close()
        sys.exit(0)

    def get_hex_by_name(self,name):

        commands = {
            'RESET': [0x1],
            'SET_CHANNELS_ENABLE': [0x2, 0xff, 0xff, 0xff],
            'DISPLAY_ON': [0x3],
            'DISPLAY_OFF': [0x4],
            'SETUP_REQ': [0x5],
            'POLL': [0x7],
            'REJECT_BANKNOTE': [0x8],
            'DISABLE': [0x09],
            'ENABLE': [0xA],
            'SERIAL': [0x0C],
            'SYNC': [0x11],
            'LAST_REJECT': [0x17],               
        }

        return commands.get(name, 0)

    def calc_crc(self,command):

        seed = 0xffff
        poly = 0x8005
        crc = seed
        for cmd in command:
            crc ^= int(cmd, 16) << 8
            for j in range(0, 8):
                if crc & 0x8000:
                    crc = ((crc << 1) & 0xffff) ^ poly
                else:
                    crc <<= 1
        #print("Este es el crc antes de ser separado: ",crc)
        return [('%02x' % (crc & 0xff)).lower(), ('%02x' % ((crc >> 8) & 0xff)).lower()]

    def getseq(self):

        self.act_sequence = not self.act_sequence
        seq = '%02x' % (0x00 | 0x80 if self.act_sequence else 0)
        return int(seq, 16)

    def build_trame(self,command):
        
        # [Byte_start, Seq, length_command, command, CRCL, CRCH]
        trame = [self.BYTE_START, self.getseq(), len(command)] + command
        trame = [hex(x) for x in trame]
        print("Este es el trame completo crc: ",trame)
        print("Este es el trame completo crc: ",list(trame))
        crc = self.calc_crc(trame[1:])
        print("Este es el crc separado: ",crc)
        trame = trame + crc
        trame = [int(x, 16) for x in trame]
        return bytes(trame)

    def write_and_read_cmd(self,command):
        try:
            self.ser.write(command)
            sleep(.2)
            data = self.ser.read(self.ser.in_waiting)
            return data
        except Exception as e:
            print(e)
            raise

    def send_command(self,command):

        cmd = self.get_hex_by_name(command)
        #print("Este es el cmd: ",cmd)

        trame = self.build_trame(cmd)
        #print("Este es el trame: ",trame)
        #print("Este es el trame: ",list(trame))

        output = self.write_and_read_cmd(trame)
        print("Este es el output: ",output)
        print("Este es el output: ",list(output))
        return output

    def handle_response(self,response):
        try:
            code_response = response[3]
            #print(self.Map_error.get(code_response))
            if (code_response == 240):
                if response[2] == 1:
                    pass
                    #print("No more information to check!")
                elif response[2] >= 2:
                    event_response = response[4]
                    if self.act_event != event_response:
                        print("1.",self.Map_events.get(event_response))
                    if ((response[2] == 3)|(response[2] == 4)):
                        bill = response[5]
                        if bill > 0:
                            print("2. Billete de ",self.Bills.get(bill),"Detectado")
                        else:
                            print("2. Billete aun no escaneado")
                        print(list(response))
                        if response[2] == 4:
                            event_response = response[6]
                            print("3. Evento adicional: ",self.Map_events.get(event_response))
                    elif (response[2] >= 4):
                        print(list(response))
                        print(response)
                    self.act_event = event_response
                    if self.act_event != event_response:
                        print("")
                else:
                    print("Invalid length!!!")
                    return False
                return True
            else:
                print("Evento diferente de OK")
                return False
            
        except Exception as e:
            print(e)


    def sync(self):
        try:
            self.act_sequence = False
            out = self.send_command('SYNC')
            res = self.handle_response(out)
            return res
        except Exception as error:
            print(error)
            return False

    def opcion1(self):

        print("")
        print("1. Seleccionando los canales...")
        print("")

        try:
            out = self.send_command('SET_CHANNELS_ENABLE')
            res = self.handle_response(out)
            return res
        except Exception as error:
            print(error)
            return False

    def opcion2(self):

        print("")
        print("2. Activando los canales...")
        print("")

        try:
            out = self.send_command('DISPLAY_ON')
            res = self.handle_response(out)
            if(res):
                out = self.send_command('ENABLE')
                res = self.handle_response(out)
                return res
            else:
                return False
        except Exception as error:
            print(error)
            return False
    
    def opcion3(self):

        print("")
        print("3. Corriendo funcion Poll...")
        print("")

        try:
            while(True):
                output = self.send_command('POLL')
                #print(output)
                #print(list(output))
                res = self.handle_response(output)
                sleep(0.2)
            return res
        except Exception as error:
            print(error)
            return False

    def opcion4(self):

        print("")
        print("4. Reiniciando...")
        print("")

        try:
            out = self.send_command('RESET')
            res = self.handle_response(out)
            return res
        except Exception as error:
            print(error)
            return False

    def opcion5(self):

        print("")
        print("5. Recibiendo parametros...")
        print("")

        try:
            out = self.send_command('SETUP_REQ')
            res = self.handle_response(out)
            return res
        except Exception as error:
            print(error)
            return False
        
CompleteTest()