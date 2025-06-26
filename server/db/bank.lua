DGCore = DGCore or {}
DGCore.DB = DGCore.DB or {}

DGCore.DB.Bank = {}

function DGCore.DB.Bank.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.Bank.SelectAll, {})
end

function DGCore.DB.Bank.SelectById(id)
    return DGCore.DB.fetchOne(DGCore.Constant.Queries.Bank.SelectById, { id })
end

function DGCore.DB.Bank.SelectByAccountNumber(account_number)
    return DGCore.DB.fetchOne(DGCore.Constant.Queries.Bank.SelectByAccountNumber, { account_number })
end

function DGCore.DB.Bank.Insert(bank)
    DGCore.DB.Insert(DGCore.Constant.Queries.Bank.Insert, bank:toInsert())
end

function DGCore.DB.Bank.Update(bank)
    DGCore.DB.Update(DGCore.Constant.Queries.Bank.Update, bank:toUpdate())
end

function DGCore.DB.Bank.UpdateAccountNumber(bank)
    DGCore.DB.Update(DGCore.Constant.Queries.UpdateAccountNumber, bank:toUpdateAccountNumber())
end

-- BankTransaction

DGCore.DB.BankTransaction = {}

function DGCore.DB.BankTransaction.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.BankTransaction.SelectAll)
end

function DGCore.DB.BankTransaction.SelectById(id)
    return DGCore.DB.fetchOne(DGCore.Constant.Queries.BankTransaction.SelectById, { id })
end

function DGCore.DB.BankTransaction.SelectByFromBank(from_bank)
    return DGCore.DB.fetch(DGCore.Constant.Queries.BankTransaction.SelectByFromBank, { from_bank })
end

function DGCore.DB.BankTransaction.Insert(BankTransaction)
    DGCore.DB.Insert(DGCore.Constant.Queries.BankTransaction.Insert, BankTransaction:toInsert())
end

function DGCore.DB.BankTransaction.Update(BankTransaction)
    DGCore.DB.Update(DGCore.Constant.Queries.BankTransaction.Update, BankTransaction:toUpdate())
end
