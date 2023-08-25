"""Backend for DDSIM."""
from __future__ import annotations

import logging

from qiskit.providers.models import BackendConfiguration

from mqt import ddsim
from mqt.ddsim.qasmsimulator import QasmSimulator

logger = logging.getLogger(__name__)


class StatevectorSimulator(QasmSimulator):
    """Python interface to MQT DDSIM"""

    SHOW_STATE_VECTOR = True

    def __init__(self, configuration=None, provider=None):
        conf = {
            "backend_name": "statevector_simulator",
            "backend_version": ddsim.__version__,
            "url": "https://github.com/cda-tum/ddsim",
            "simulator": True,
            "local": True,
            "description": "MQT DDSIM C++ simulator",
            "basis_gates": [
                "id",
                "u0",
                "u1",
                "u2",
                "u3",
                "cu3",
                "x",
                "cx",
                "ccx",
                "mcx_gray",
                "mcx_recursive",
                "mcx_vchain",
                "y",
                "cy",
                "z",
                "cz",
                "h",
                "ch",
                "s",
                "sdg",
                "t",
                "tdg",
                "rx",
                "crx",
                "mcrx",
                "ry",
                "cry",
                "mcry",
                "rz",
                "crz",
                "mcrz",
                "p",
                "cp",
                "cu1",
                "mcphase",
                "sx",
                "csx",
                "sxdg",
                "swap",
                "cswap",
                "iswap",
                "snapshot",
            ],
            "memory": False,
            "n_qubits": 64,
            "coupling_map": None,
            "conditional": False,
            "max_shots": 1000000000,
            "open_pulse": False,
            "gates": [],
        }
        super().__init__(configuration=configuration or BackendConfiguration.from_dict(conf), provider=provider)

    def _validate(self, quantum_circuit):
        return
