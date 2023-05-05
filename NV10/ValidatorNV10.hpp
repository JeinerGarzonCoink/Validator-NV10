/**
 * @file ValidatorNV10.hpp
 * @author Oscar Pineda (o.pineda@coink.com)
 * @brief Header de las funciones del validador NV10
 * @version 0.1
 * @date 2023-02-15
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#ifndef VALIDATORNV10
#define VALIDATORNV10

#include <stdio.h>
#include <cstring> // To include strerror
#include <fcntl.h> // Contains file controls like O_RDWR
#include <errno.h> // To include errno
#include <termios.h> // Contains POSIX terminal control definitions
#include <unistd.h> // write(), read(), close()
#include <sys/ioctl.h> //To use flush
#include <bitset> //To use bitset in HandleResponseInfo

#include "spdlog/spdlog.h" //Logging library
#include "spdlog/sinks/daily_file_sink.h" //Logging library - daily file

#include <vector>
#include <iostream>
#include <string>

namespace ValidatorNV10{

    struct SpdlogLevels_t{
        int Code;
        std::string Message;
    };

    struct Bills_t{
        int Channel;
        int Bill;
    };

    struct ErrorCodes_t{
        int Code;
        std::string Message;
    };

    class NV10Class{
        public:

            // --------------- EXTERNAL VARIABLES --------------------//

            /**
             * @brief Descriptor de archivo del puerto del validador
             */
            int SerialPort;

            /**
             * @brief Bandera que incica si fue exitosa la conexion al puerto serial del validador
             */
            bool SuccessConnect;

            /**
             * @brief Nivel de logging de la libreria Spdlog
             */
            int LoggerLevel;

            /**
             * @brief Este puerto es el resultante del escaneo de la funcion ScanPorts
             */

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

            // --------------- CONSTRUCTOR FUNCTIONS --------------------//

            /**
             * @brief Constructor de la clase NV10Class
             */
            NV10Class();
            
            /**
             * @brief Destructor de la clase NV10Class
             */
            ~NV10Class();

            // --------------- LOGGER FUNCTIONS --------------------//

            SpdlogLevels_t SearchSpdlogLevel(int Code);
            void SetSpdlogLevel();

            // --------------- SEARCH FUNCTIONS --------------------//

            ErrorCodes_t SearchErrorCodeExComm (int Code);
            Bills_t SearchBill (int Channel);
            ErrorCodes_t SearchErrorCodes (int Code);
            ErrorCodes_t SearchEventCodes (int Code);
            ErrorCodes_t SearchLastReject (int Code);

            // --------------- STATES OF MACHINE STATE (FUNCTIONS) --------------------//

            int StIdle();
            int StConnect();
            int StDisable();
            int StEnable();
            int StPolling();
            int StCheck();
            int StError();

            // --------------- MAIN FUNCTIONS --------------------//
            
            int ConnectSerial(int Port);
            int ScanPorts();
            int SendingCommand(std::vector<unsigned char> Comm);
            int GetSeq();
            std::vector<unsigned char> CalcCRC(std::vector<unsigned char> command);
            std::vector<unsigned char> BuildCmd(std::vector<unsigned char> Comm);
            int ExecuteCommand(std::vector<unsigned char> Comm);
            int HandleResponse(std::vector<unsigned char> Response);
            int HandleEvent(std::vector<unsigned char> Response);
            int HandleLRC(std::vector<unsigned char> Response);
            int HandleChannel(std::vector<unsigned char> Response);
            int HandleCode(std::vector<unsigned char> Response); 
            int DisplayOn();
            int DisplayOff();
            int SetChannels();
            int Enable();
            int Disable();
            int Poll();
            int LastReject();
            int Sync();
            int Hold();
    };
}

#endif /* VALIDATORNV10 */