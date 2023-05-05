/**
 * @file Funciones validador.cpp
 * @author Oscar Pineda (o.pineda@dcoink.com)
 * @brief Funciones principales del Validador NV10 (Billetero)
 * @version 0.1
 * @date 2023-04-28
 * 
 * @copyright Copyright (c) 2023
 * 
 */

// --------------- LOGGER FUNCTIONS --------------------//

/**
 * @brief Funcion que busca el nivel de logging de spdlog de acuerdo a un codigo
 * @param Code Codigo de logging entero que va desde 0 hasta 6
 * @return SpdlogLevels_t Estructura que contiene un codigo y un mensaje
 */
SpdlogLevels_t SearchSpdlogLevel(int Code);

/**
 * @brief Funcion que establece el nivel de logging general de acuerdo a la variable global LoggerLevel
 */
void SetSpdlogLevel();

// --------------- SEARCH FUNCTIONS --------------------//

/**
 * @brief Funcion que busca el mensaje de error que retorna la funcion ExecuteCommand usando el codigo de error asociado
 * @param Code Codigo de error entero que va desde -5 hasta 4
 * @return ErrorCodeExComm_t Estructura que contiene un codigo y un mensaje
 */
ErrorCodeExComm_t SearchErrorCodeExComm (int Code);

/**
 * @brief Funcion que busca el billete asociado al canal ingresado
 * @param Channel Canal de billete que informa el validador
 * @return Bills_t Estructura que contiene un canal y un valor de billete entero
 */
Bills_t SearchBill (int Channel);

/**
 * @brief Funcion que busca un codigo de error asociado al comando enviado
 * @param Code Codigo de fallo
 * @return ErrorCodes_t Estructura que contiene un codigo de fallo y un mensaje
 */
ErrorCodes_t SearchErrorCodes (int Code);

/**
 * @brief Funcion que busca un codigo de evento asociado al comando enviado
 * @param Code Codigo de evento
 * @return ErrorCodes_t Estructura que contiene un codigo de evento y un mensaje
 */
ErrorCodes_t SearchEventCodes (int Code);

/**
 * @brief Funcion que busca un codigo de ultimo rechazo asociado al comando enviado
 * @param Code Codigo de ultimo rechazo
 * @return ErrorCodes_t Estructura que contiene un codigo de ultimo rechazo y un mensaje
 */
ErrorCodes_t SearchLastReject (int Code);

// --------------- STATES OF MACHINE STATE (FUNCTIONS) --------------------//

/**
* @brief Estado cero de la maquina de estados, configura el logger de spdlog
* @return int - Retorna 0 siempre
*/
int StIdle();

/**
* @brief Primer estado, escanea los puertos, envia un comando Sync al billetero y se conecta al puerto que le responda exitosamente
* @return int - Retorna 0 si se pudo conectar al puerto
* @return int - Retorna 1 si no se pudo conectar al puerto
*/
int StConnect();

/**
* @brief Segundo estado, desabilita los canales y el display del bezel
* @return int - Retorna 0 si pudo correr las 2 anteriores funciones exitosamente
* @return int - Retorna 1 si no se pudo correr alguna de las 2 funciones anteriores o si hubo algun codigo de falla grave
*/
int StDisable();

/**
* @brief Tercer estado, Se vuelve a sincronizar, habilita el display, selecciona y activa los canales por ultimo revisa cual fue el ultimo codigo de rechazo
* @return int - Retorna 0 si pudo correr las 5 anteriores funciones exitosamente
* @return int - Retorna 1 si no se pudo correr alguna de las 5 funciones anteriores
*/
int StEnable()

/**
* @brief Cuarto estado, hace polling al validador si detecta un billete corre el comando hold
* @return Si retorna  0 -> [SC] Todo funciona correctamente
* @return Si retorna  1 -> [SC] No pudo hacer el polling
*/
int StPolling();

/**
* @brief Quinto estado, Revisa el ultimo codigo de rechazo, hace un poll para revisar el ultimo billete y borrarlo
* @return int - Retorna 0 si pudo correr las 2 anteriores funciones exitosamente
* @return int - Retorna 1 si no se pudo correr alguna de las 2 funciones anteriores o si el evento no esta en cero
*/
int StCheck();

/**
* @brief Estado de error, revisa la conexion 
* @return int - Retorna 0 si pudo correr el sync exitosamente
* @return int - Retorna 1 si ni siquiera se pudo sincronizar
*/
int StError();

// --------------- MAIN FUNCTIONS --------------------//

/**
* @brief Se conecta al puerto con las caracteristicas definidas en la hoja de datos del validador
* @brief Cambia bandera de conexion exitosa/fallida
* @brief [Solo deberia correrse una vez]
* @param Port Puerto a conectar entero igual o mayor que cero
* @return int - Retorna 0 si la conexion fue exitosa
* @return int - Retorna 1 si el puerto es invalido
* @return int - Retorna 2 si no puede leer los parametros actuales del puerto
* @return int - Retorna 3 si no puede escribir los nuevos parametros del puerto
* @return int - Retorna 4 si no se pudo conectar al puerto
*/
int ConnectSerial(int Port);

/**
* @brief Corre la funcion ConnectSerial(n) y luego la funcion SimplePoll() en cada puerto, 
* @brief si logra correr las dos sin errores devuelve el numero de puerto n
* @brief [Solo deberia correrse una vez]
* @return int - Retorna el numero de puerto desde 0 en adelante si encontro, en otro caso devuelve -1
*/
int ScanPorts();

/**
* @brief Genera una secuencia alternada de 0 y 128 para sincronizar la comunicacion con el billetero
* @return Retorna un entero (0 o 128)
*/
int NV10Class::GetSeq();

/**
* @brief Calcula el CRC haciendo XOR y corriendo los bits, esto lo hace de la misma forma que el billetero en su programa interno
* @param Comm Comando incompleto que se va a enviar al billetero (todo menos el encabezado y los dos ultimos bytes de crc)
* @return Retorna 2 bytes el bit menos significativo y el mas significativo del CRC
*/
std::vector<unsigned char> NV10Class::CalcCRC(std::vector<unsigned char> Comm);

/**
* @brief Construye el comando a enviar, que depende de la secuencia, del comando que se quiera y del CRC
* @param Comm Comando incompleto que se va a enviar al billetero (solo el comando de la hoja de datos - ssp-manual)
* @return Retorna el comanndo completo a enviar al billetero
*/
std::vector<unsigned char> NV10Class::BuildCmd(std::vector<unsigned char> Comm);

/**
* @brief Maneja la respuesta de Execute command para que solo sean 4 respuestas
* @param Comm Comando a escribir en el puerto
* @return Si retorna -2 -> [SC] El validador reporta que ya habia revisado el comando y no es necesario
* @return Si retorna -1 -> [SC] Hubo un error grave enviando el comando
* @return Si retorna  0 -> [SC] Todo funciona correctamente
* @return Si retorna  1 -> [SC] Hay que repetir el envio del comando, ya que el validador no lo pudo reconocer
* @return Si retorna  2 -> [SC] No ejecuto el comando
*/
int SendingCommand(std::vector<unsigned char> Comm);

/**
* @brief Escribe el comando Comm en el puerto, luego lee la respuesta. 
* @brief Si la respuesta no es mayor o igual que la longitud del comando escrito, envia codigo diferente de 0
* @brief Si la longitud de la respuesta es igual a la longitud del comando escrito menos uno (longitud real), quiere decir que no reconoce el comando o la direccion de destino 
* @param Comm Comando a escribir en el puerto
* @return Si retorna -5 -> [EC] El validador no responde, tiempo de espera agotado
* @return Si retorna -4 -> [EC|HRI] Hubo un error de lectura de respuesta
* @return Si retorna -3 -> [EC] Hubo un error de escritura de comando
* @return Si retorna -2 -> [HR/HC/EC] No ejecutó las funciones
* @return Si retorna -1 -> [HR] La longiutd de los datos es 0 o mayor a 4, error grave
* @return Si retorna  0 -> [HC] El codigo de respuesta es OK
* @return Si retorna  1 -> [HC] El codigo de respuesta es diferente de OK
* @return Si retorna  2 -> [HR] La respuesta ya se reviso anteriormente, se espera por una nueva
* @return Si retorna  3 -> [HR] La respuesta no comienza por 127, es decir que no se puede decodificar porque llego corrida
* @return Si retorna  4 -> [EC] La respuesta llego muy corta, no se dio el tiempo de espera suficiente para leer
 */
 int ExecuteCommand(std::vector<unsigned char> Comm);

/**
* @brief Maneja la respuesta que llega, revisa que el mensaje llegue bien, revisa la longitud de los datos adicionales y maneja la respuesta de acuerdo a la longitud de estos datos
* @param Response Respuesta que envia el validador
* @return Si retorna -2 -> [HR/HC] No ejecutó las funciones
* @return Si retorna -1 -> [HR] La longiutd de los datos es 0 o mayor a 4, error grave
* @return Si retorna  0 -> [HC] El codigo de respuesta es OK
* @return Si retorna  1 -> [HC] El codigo de respuesta es diferente de OK
* @return Si retorna  2 -> [HR] La respuesta ya se reviso anteriormente, se espera por una nueva
* @return Si retorna  3 -> [HR] La respuesta no comienza por 127, es decir que no se puede decodificar porque llego corrida
*/
int HandleResponse(std::vector<unsigned char> Response);

/**
* @brief Toma el codigo de respuesta que envia el billetero y busca el mensaje asociado
* @param Response Respuesta que envia el billetero
* @return Si retorna  0 -> El codigo de respuesta es OK
* @return Si retorna  1 -> El codigo de respuesta es diferente de OK
*/
int HandleCode(std::vector<unsigned char> Response);

/**
* @brief Toma el codigo del evento que envia el billetero y busca el mensaje asociado
* @param Response Respuesta que envia el billetero
* @return Si retorna  0 -> El evento pudo ser identificado
* @return Si retorna  1 -> El evento no pudo ser identificado
*/
int HandleEvent(std::vector<unsigned char> Response);

/**
* @brief Toma el canal que envia el billetero y busca el billete asociado
* @param Response Respuesta que envia el billetero
* @return Si retorna  0 -> El billete pudo ser identificado
* @return Si retorna  1 -> El billete no pudo ser identificado
*/
int HandleChannel(std::vector<unsigned char> Response);

/**
 * @brief Corre el comando DYSPLAY_ON para encender el bezel
 * @return Si retorna 1 -> Error grave enviando el comando, no se pudo encender el bezel
 * @return Si retorna 0 -> Todo corrio exitosamente
 */
int DisplayOn();

/**
 * @brief Corre el comando DYSPLAY_OFF para apagar el bezel
 * @return Si retorna 1 -> Error grave enviando el comando, no se pudo apagar el bezel
 * @return Si retorna 0 -> Todo corrio exitosamente
 */
int DisplayOff();

/**
 * @brief Corre el comando SET_CHANNELS_ENABLE para seleccionar los canales a activar
 * @return Si retorna 1 -> Error grave enviando el comando, no se pudo seleccionar los canales a activar
 * @return Si retorna 0 -> Todo corrio exitosamente
 */
int SetChannels();

/**
 * @brief Corre el comando ENABLE para encender habilitar los canales del billetero
 * @return Si retorna 1 -> Error grave enviando el comando, no se pudo correr enable
 * @return Si retorna 0 -> Todo corrio exitosamente
 */
int Enable();

/**
 * @brief Corre el comando DISABLE para deshabilitar los canales del billetero
 * @return Si retorna 1 -> Error grave enviando el comando, no se pudo correr disable
 * @return Si retorna 0 -> Todo corrio exitosamente
 */
int Disable();

/**
 * @brief Corre el comando POLL para revisar el estado y que billetes se han metido
 * @return Si retorna 1 -> Error grave enviando el comando, no se pudo correr poll
 * @return Si retorna 0 -> Todo corrio exitosamente
 */
int Poll();

/**
 * @brief Corre el comando LAST_REJECT para revisar el ultimo error de rechazo
 * @return Si retorna 1 -> Error grave enviando el comando, no se pudo correr last reject
 * @return Si retorna 0 -> Todo corrio exitosamente
 */
int LastReject();

/**
 * @brief Corre el comando SYNC para sincronizar comunicacion con el billetero
 * @return Si retorna 1 -> Error grave enviando el comando, no se pudo correr sync
 * @return Si retorna 0 -> Todo corrio exitosamente
 */
int Sync();

/**
 * @brief Corre el comando HOLD para mantener el billete que se ha insertado
 * @return Si retorna 1 -> Error grave enviando el comando, no se pudo correr hold
 * @return Si retorna 0 -> Todo corrio exitosamente
 */
int Hold();

