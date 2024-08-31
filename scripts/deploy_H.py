from ape import project, accounts

def main():
    account = accounts.load("meta_wallet")

    account.deploy(project.Hello)