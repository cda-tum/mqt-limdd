"""
Exception for errors raised by DDSIM simulator.
"""

from __future__ import annotations

from qiskit import QiskitError


class DDSIMError(QiskitError):
    """Class for errors raised by the DDSIM simulator."""

    def __init__(self, *message):
        """Set the error message."""
        super().__init__(*message)
        self.message = " ".join(message)

    def __str__(self):
        """Return the message."""
        return repr(self.message)
