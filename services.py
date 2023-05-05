"""
Coin Services
"""
from threading import Thread
from ... import LOGGER
from .models import BillAcceptorTypes
from .acceptors import TypeIBillAcceptor, BillAcceptorNV10
from ..services import ConnectService
from ...config import BILL_ACCEPTOR_TYPE


class BillService(ConnectService):
    """
    Bill Service
    """

    def __init__(self):
        super(BillService, self).__init__()

        LOGGER.debug('[HW-BILL] Creating bill acceptor type [%s]...',
                     BILL_ACCEPTOR_TYPE.name)

        if BILL_ACCEPTOR_TYPE == BillAcceptorTypes.TYPE_I:
            self.bill_acceptor = TypeIBillAcceptor()
        elif BILL_ACCEPTOR_TYPE == BillAcceptorTypes.NV10:
            self.bill_acceptor = BillAcceptorNV10()            
        else:
            self.bill_acceptor = None

            LOGGER.error('[HW-BILL] Error setting bill acceptor type [%s]!',
                         BILL_ACCEPTOR_TYPE)


    def _on_start(self):
        if self.bill_acceptor:
            Thread(target=self.bill_acceptor.start).start()
            return True

    def _on_stop(self):
        if self.bill_acceptor:
            self.bill_acceptor.stop()

        return True
