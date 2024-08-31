#pragma version ^0.3.10

number: public(uint256)

@external
def set_number(_num: uint256):
    self.number = _num