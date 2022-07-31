# See LICENSE.vyoma for details

# SPDX-License-Identifier: CC0-1.0

import os
import random
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge
@cocotb.test()
async def test_ring_oscillator_1(dut):
    """Test for seq detection """


    # reset
    dut.reset.value = 1
    dut.en.value = 1
    dut.S0.value = 0
    dut.S1.value = 0 
