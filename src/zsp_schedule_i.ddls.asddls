@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Schedule interface view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSP_SCHEDULE_I as select from zsp_schedule

association to parent ZSP_ITEM_I as _ITEM on $projection.So = _ITEM.So and $projection.Item = _ITEM.Item

association [1] to ZSP_HEADER_I as _HEADER on $projection.So = _HEADER.So
{
    key so as So,
    key item as Item,
    key slno as slno,
    schedule_cat as ScheduleCat,
    
//    @Semantics.systemDateTime.createdAt: true
    deliv_date as DelivDate,
    
    @Semantics.quantity.unitOfMeasure: 'SaleUnit'
    order_qty as OrderQty,
    
    @Semantics.quantity.unitOfMeasure: 'SaleUnit'
    confirmed_qty as ConfirmedQty,
    
    sale_unit as SaleUnit,
    
    @Semantics.systemDateTime.lastChangedAt: true 
    local_last_changed_at as LocalLastChangedAt,
    
    _ITEM ,
    _HEADER
}
