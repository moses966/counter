#pragma version >0.3.10

# Declare the Vyper interface
interface AutomationCompatibleInterface:

    # Check if upkeep is needed
    def checkUpkeep(checkData: Bytes[1024]) -> (bool, Bytes[1024]):view

    # Perform the upkeep
    def performUpkeep(performData: Bytes[100]):nonpayable

counter: public(uint256) # public counter variable
interval: public(immutable(uint256))
lastTimeStamp: public(uint256)

@deploy
def __init__(updateInterval: uint256):
    interval = updateInterval
    self.lastTimeStamp = block.timestamp
    self.counter = 0

@view
@external
def checkUpkeep(checkData: Bytes[1024]) -> (bool, Bytes[1024]):
    upkeepNeeded: bool = (block.timestamp - self.lastTimeStamp) > interval
    return upkeepNeeded, checkData

@external
def performUpkeep(performData: Bytes[1024]):
    if (block.timestamp - self.lastTimeStamp) > interval:
        self.lastTimeStamp = block.timestamp
        self.counter += 1
    # Note: performData is passed, but not used in this example.
    

#@external
#def performUpkeep(performData: Bytes[1024]):
    # Example: Decoding performData to update specific state
    #data: uint256 = convert(slice(performData, start=0, len=32), uint256)
    #if (block.timestamp - self.lastTimeStamp) > self.interval:
        #self.lastTimeStamp = block.timestamp
        #self.counter += data  # increment by the decoded value

