from ape import accounts, project

def main():
    deployer = accounts.load("meta_wallet")
    
    # Set the interval for the upkeep (e.g., 60 seconds)
    update_interval = 60
    
    # Deploy the contract
    #contract = deployer.deploy(
        #project.Counter,
        #update_interval
    #)
    contract = project.Counter.at("0xC6C6dd67396C9F9C07ebAD9D2b400B977dF61470")
    
    # Display the deployed contract address and other details
    print(f"Contract deployed at: {contract.address}")
    print(f"Initial counter value: {contract.counter()}")
    print(f"Interval set to: {contract.interval()}")
    print(f"Last timestamp: {contract.lastTimeStamp()}")
    
    # Example of calling the checkUpkeep function
    #upkeep_needed, check_data = contract.checkUpkeep(b"")
    #print(f"Upkeep needed: {upkeep_needed}")
    #print(f"Check data: {check_data}")
    
    # If upkeep is needed, perform it
    #if upkeep_needed:
        #contract.performUpkeep(b"", sender=deployer)
    print(f"Counter after upkeep: {contract.counter()}")
