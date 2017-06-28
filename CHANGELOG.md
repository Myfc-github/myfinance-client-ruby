# Changelog
## v1.4.0
### New attributes
- `Sale` now has the following new attributes:
  - `attachments_count`, reflecting the fact that `Sale` can now have attachments
  - `ticket_amount`, amount needed to pay due to some kind of penalty
  - `interest_amount`, interest amount
  - `discount_amount`, amount that will be reduced because of a discount
  - `total_amount`, equals nominal_amount + ticket_amount + interest_amount - discount_amount
  - `api_related`, `true` if `Sale` was created by the API, `false` otherwise
  - `tax_charges_attributes`, reflecting the fact that `Sale` can now have taxes
### Attributes renamed
- `Sale`:
  - `liquidation_week_day` changed to `liquidation_weekday`, conforming to Rails' convention
- `FinancialAccount`:
  - `financial_account_taxes_attributes` was changed to `tax_charges_attributes`
## v1.3.1
### Fixes
- Fix lib require to be relatively

## v1.3.0
### New Endpoints
- Add endpoints for `Sale`, `SaleAccount` and `SaleRule`

## v1.2.0
### Endpoints improvements
- The `#find_all` method of all endpoints that support filtering can now receive parameters to refine the results and paginate.
### Deprecations
- No longer supports `#find_by`. Use `#find_all` instead, passing filters as a hash if needed.
### Fixes
- Params encoding set to Rack. This is necessary in order to fix an issue with Array parameters.

## v1.1.0

### New Endpoints
- Add endpoint Deposit Accounts filtering.
- Add endpoint Entities filtering.

## v1.0.0

### New Endpoints
- Add Bank Statements endpoints.
- Add Categories endpoints.
- Add Credit Cards endpoints.
- Add Credit Cards Transactions endpoints.
- Add Reconciles endpoints.
- More endpoints for Financial Accounts (`find_all`, `find`).
### Improvements
- Implement search by attributes in Categories.
###  Deprecations
- `FinancialAccount#destroy` and `#update` signatures are now `(entity_id, id, params)` instead of `(id, entity_id, params)`.
