"""
Bill Websockets
"""
from .services import BillService
from ..constants import BILL_ACCEPTOR_START, BILL_ACCEPTOR_STOP
from ... import SOCKET_IO, LOGGER
from ...config import TYPE_HW
from ...models import TypesPiggybank

BILL_SERVICE = BillService()

@SOCKET_IO.on(BILL_ACCEPTOR_START)
def bill_start():
    LOGGER.warning('[HARDWARE-BILL] SOCKET_IO START BILL ACCEPTOR')
    BILL_SERVICE.start()

@SOCKET_IO.on(BILL_ACCEPTOR_STOP)
def bill_stop():
    LOGGER.warning('[HARDWARE-BILL] SOCKET_IO STOP BILL ACCEPTOR')
    BILL_SERVICE.stop()
