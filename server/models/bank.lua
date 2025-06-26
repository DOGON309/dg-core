DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}

function DGCore.Model.Bank(id, account_number, type, balance, is_disable, is_infinite, transactions)
    local self = {}

    self.id = id
    self.account_number = account_number
    self.type = type
    self.balance = balance
    self.is_disable = is_disable
    self.is_infinite = is_infinite

    self.transactions = DGCore.Model.BankTransactions(transactions) or {}

    function self:toInsert()
        return {
            self.id,
            self.account_number,
            self.type,
            self.balance,
            self.is_disable,
            self.is_infinite
        }
    end

    function self.toUpdate()
        return {
            self.account_number,
            self.type,
            self.balance,
            self.is_disable,
            self.is_infinite,
            self.id
        }
    end

    function self:toUpdateAccountNumber()
        return {
            self.account_number,
            self.id
        }
    end

    return self
end

function DGCore.Model.BankTransactions(transactions)
    local result = {}
    for i, row in ipairs(transactions) do
        result[i] = DGCore.BankTransaction(row.id, row.type, row.from_bank, row.to_bank, row.amount, row.balance_after, row.message, row.timestamp)
    end
    return result
end

function DGCore.Model.BankTransaction(id, type, from_bank, to_bank, amount, balance_after, message, timestamp)
    local self = {}

    self.id = id
    self.type = type 
    self.from_bank = from_bank
    self.to_bank = to_bank
    self.amount = amount
    self.balance_after = balance_after
    self.message = message
    self.timestamp = timestamp

    function self:toInsert()
        return {
            self.id,
            self.type,
            self.from_bank,
            self.to_bank,
            self.amount,
            self.balance_after,
            self.message
        }
    end

    function self:toUpdate()
        return {
            self.type,
            self.from_bank,
            self.to_bank,
            self.amount,
            self.balance_after,
            self.message,
            self.id
        }
    end

    return self
end