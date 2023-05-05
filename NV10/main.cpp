/**
 * @file main.cpp
 * @author Oscar Pineda (o.pineda@coink.com)
 * @brief Archivo principal que llama a las funciones del validador NV10
 * @version 0.1
 * @date 2023-02-15
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <stdio.h>
#include <stdbool.h>
#include <iostream>

#include "StateMachine.hpp"
#include "ValidatorNV10.hpp"

using namespace StateMachine;

int main() {
    
    using namespace ValidatorNV10;

    int Response = 0;

    printf("main() called.\r\n");

    NV10Class NV10Object;
    NV10Class* NV10Pointer = &NV10Object;
    SMClass SMObject(NV10Pointer);

    NV10Object.LoggerLevel = 0;

    std::cout<<"[MAIN] Iniciando maquina de estados"<<std::endl;
    SMObject.InitStateMachine();
    std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;

    std::cout<<"[MAIN] Cambio de estado ST_IDLE ---> ST_CONNECT"<<std::endl;
    Response = SMObject.StateMachineRun(SMClass::EV_ANY);
    std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;

    if (Response != 0){
        std::cout<<"[MAIN] No se pudo conectar a ningun puerto"<<std::endl;
        std::cout<<"[MAIN] Cambio de estado ST_CONNECT ---> ST_ERROR"<<std::endl;
        Response = SMObject.StateMachineRun(SMClass::EV_ERROR);
        std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;
        return 1;
    }

    std::cout<<"[MAIN] Cambio de estado ST_CONNECT ---> ST_DISABLE"<<std::endl;
    Response = SMObject.StateMachineRun(SMClass::EV_SUCCESS_CONN);
    std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;

    if (Response != 0){
        std::cout<<"[MAIN] No pudo habilitar canales"<<std::endl;
        std::cout<<"[MAIN] Cambio de estado ST_DISABLE ---> ST_ERROR"<<std::endl;
        Response = SMObject.StateMachineRun(SMClass::EV_ERROR);
        std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;
        return 1;
    }

    std::cout<<"[MAIN] Cambio de estado ST_DISABLE ---> ST_ENABLE"<<std::endl;
    Response = SMObject.StateMachineRun(SMClass::EV_READY);
    std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;

    if (Response != 0){
        std::cout<<"[MAIN] No pudo revisar el ultimo codigo de rechazo"<<std::endl;
        std::cout<<"[MAIN] Cambio de estado ST_ENABLE ---> ST_ERROR"<<std::endl;
        Response = SMObject.StateMachineRun(SMClass::EV_ERROR);
        std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;
        return 1;
    }

    std::cout<<"[MAIN] Ultimo codigo de rechazo: "<<NV10Object.LROCode<<std::endl;
    std::cout<<"[MAIN] Ultimo mensaje de rechazo: "<<NV10Object.LROMsg<<std::endl;

    std::cout<<"[MAIN] Cambio de estado ST_ENABLE ---> ST_POLLING"<<std::endl;
    Response = SMObject.StateMachineRun(SMClass::EV_CALL_POLLING);
    std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;
    
    std::cout<<"Listo para recibir billetes"<<std::endl;

    int i = 0;
    while (i<100){
        
        Response = SMObject.StateMachineRun(SMClass::EV_POLL);

        if(Response == 0){
            if(NV10Object.LengthData >= 2){
                std::cout<<"[MAIN] Codigo de evento actual: "<<NV10Object.EventOCode<<std::endl;
                std::cout<<"[MAIN] Mensaje de evento actual: "<<NV10Object.EventOMsg<<std::endl;

                if ((NV10Object.EventOCode == 225)|(NV10Object.EventOCode == 226)|(NV10Object.EventOCode == 230)|(NV10Object.EventOCode == 239)|(NV10Object.EventOCode == 238)){
                    std::cout<<"[MAIN] Billete actual: "<<NV10Object.Bill<<std::endl;
                    if(NV10Object.LengthData == 4){
                        std::cout<<"[MAIN] Codigo de evento adicional actual: "<<NV10Object.AdEventOCode<<std::endl;
                        std::cout<<"[MAIN] Mensaje de evento adicional actual: "<<NV10Object.AdEventOMsg<<std::endl;
                    }
                }
            }
            else {
                std::cout<<"[MAIN] Codigo de error actual: "<<NV10Object.ErrorOCode<<std::endl;
                std::cout<<"[MAIN] Mensaje de error actual: "<<NV10Object.ErrorOMsg<<std::endl;
            }
        }
        else if(Response == 1){
            std::cout<<"[MAIN] Codigo de error: "<<NV10Object.ErrorOCode<<std::endl;
            std::cout<<"[MAIN] Mensaje de error: "<<NV10Object.ErrorOMsg<<std::endl;
        }

        i++;
        sleep(0.1);
    }
   
    std::cout<<"Finaliza ciclo de aceptacion de billetes"<<std::endl;

    std::cout<<"[MAIN] Cambio de estado ST_POLLING ---> ST_CHECK"<<std::endl;
    Response = SMObject.StateMachineRun(SMClass::EV_FINISH_POLL);
    std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;

    if (Response != 0){
        std::cout<<"[MAIN] No pudo revisar ultimos parametros para reiniciar el bucle"<<std::endl;
        std::cout<<"[MAIN] Cambio de estado ST_CHECK ---> ST_ERROR"<<std::endl;
        Response = SMObject.StateMachineRun(SMClass::EV_ERROR);
        std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;
        return 1;
    }

    std::cout<<"[MAIN] Ultimo codigo de rechazo: "<<NV10Object.LROCode<<std::endl;
    std::cout<<"[MAIN] Ultimo mensaje de rechazo: "<<NV10Object.LROMsg<<std::endl;

    std::cout<<"[MAIN] Cambio de estado ST_CHECK ---> ST_DISABLE"<<std::endl;
    Response = SMObject.StateMachineRun(SMClass::EV_LOOP);
    std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;

    if (Response != 0){
        std::cout<<"[MAIN] No pudo deshabilitar canales"<<std::endl;
        std::cout<<"[MAIN] Cambio de estado ST_DISABLE ---> ST_ERROR"<<std::endl;
        Response = SMObject.StateMachineRun(SMClass::EV_ERROR);
        std::cout<<"[MAIN] Estado actual: "<<SMObject.StateMachineGetStateName(SMObject.SM.CurrState)<<std::endl;
        return 1;
    }

    std::cout<<"[MAIN] TEST FINALIZADO CON EXITO :D"<<std::endl;

    return 0;
}

//g++ -o main main.cpp StateMachine.cpp ValidatorNV10.cpp -I/home/coink/oink/piggybank/connect/bill/NV10/spdlog/include/