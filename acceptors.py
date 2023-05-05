"""
Bill Acceptor
"""

from time import sleep
from serial import Serial
from ..constants import (COIN_DEPOSIT, DE_CODE_SUCSSES,
                          DE_CODE_ERROR, BILL_ACCEPTOR_READY, BILL_ACCEPTOR_ERROR,
                          BILL_ACCEPTOR_SUCCESS, BILL_ACCEPTOR_NODETECTED, BILL_ACCEPTOR_COINK_ERROR,
                          BILL_DEPOSIT, DE_BILL_ACCEPTOR, BILL_ACCEPTOR_PROCESSING)

from ... import SOCKET_IO, LOGGER
from ...services import BaseService
from ...api.deposit.services import DEPOSIT_INPUT_SERVICE
from ..devices_status.services import DevicesStatusService

from piggybank.connect.coin.Azkoyen.CythonNV10 import *

LOG_NAME = '[HARDWARE-BILL] '

class BillAcceptor(BaseService):
    """
    BillAcceptor
    """
    __stop_accepting = False

    def _on_acceptor_ready(self):
        SOCKET_IO.emit(BILL_ACCEPTOR_READY)

    def _on_any_error(self, error=None, message=None):
        if error is not None:
            LOGGER.error('[HW-BILL] Error Bill. Error: %s  | Message: %s', str(error), str(message))
            DevicesStatusService().save(DE_BILL_ACCEPTOR, DE_CODE_ERROR, str(error))
            LOGGER.debug('Emit error bill acceptor')
            SOCKET_IO.emit(BILL_ACCEPTOR_COINK_ERROR, error)

    def _on_any_warning(self, alert=None, message=None):
        if alert is not None:
            pass
            #TODO
            #DevicesStatusService().save(DE_BILL_ACCEPTOR, DE_CODE_WARNING, str(error))

    def _on_invalid_coin_detected(self, coin):
        LOGGER.warning(LOG_NAME + 'Invalid coin detection [%s]', coin)

        SOCKET_IO.emit(BILL_ACCEPTOR_ERROR)

    def _on_acceptor_processing(self, event):
        SOCKET_IO.emit(BILL_ACCEPTOR_PROCESSING, event)

    def _on_not_bill_detected(self):
        LOGGER.warning(LOG_NAME + 'No detected coin')
        SOCKET_IO.emit(BILL_ACCEPTOR_NODETECTED)

    def _on_bill_detected(self, bill):
        LOGGER.warning(LOG_NAME + 'Identified bill [%s]', bill)
        SOCKET_IO.emit(BILL_ACCEPTOR_SUCCESS, {BILL_DEPOSIT: bill})
        DEPOSIT_INPUT_SERVICE.deposit_bill(bill)

    def _was_stopped(self):
        return self.__stop_accepting

    def _on_start(self):
        pass

    def start(self):
        self.__stop_accepting = False
        self._on_start()

    def stop(self):
        self.__stop_accepting = True


class TypeIBillAcceptor(BillAcceptor):

    def __init__(self):
        pass


'''
Bill Acceptor NV10
'''

class BillAcceptorNV10(BillAcceptor):

    def __init__(self):
        pass   



