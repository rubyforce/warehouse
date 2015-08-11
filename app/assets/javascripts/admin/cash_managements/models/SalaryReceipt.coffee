@cash_managements.factory "SalaryReceipt", [
    "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
    ($http, RailsResource, railsResourceFactory, railsSerializer) ->
        SalaryReceipt = railsResourceFactory
           url: '/admin/salary_receipts'
           name: 'salary_receipt'
           serializer: railsSerializer ->
               @nestedAttribute('employeeSalaryReceipts')

        SalaryReceipt
]


# Example:
#
# salary_receipt: {
#    year: '2015',
#    month: 'January',
#
#    empoyee_salary_receipts_attributes: {
#     0 => { salary: 1000, employee_id: 1 },
#     ...
#     3 => { salary: 3000, employee_id: 3 }
#    }
# }
