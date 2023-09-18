CREATE OR REPLACE VIEW drv_item_details
 AS
 SELECT src_inventory_item.id,
    (instance_details.jsonb -> 'metadata'::text) ->> 'createdDate'::text AS instance_created_date,
    hrim.instanceid AS instance_id,
    jsonb_path_query_first(instance_details.jsonb, '$."contributors"[*]?(@."primary" == true)."name"'::jsonpath) #>> '{}'::text[] AS instance_primary_contributor,
    instance_details.jsonb ->> 'indexTitle'::text AS instance_title,
    (instance_details.jsonb -> 'metadata'::text) ->> 'updatedDate'::text AS instance_updated_date,
    src_inventory_item.jsonb ->> 'barcode'::text AS item_barcode,
    src_inventory_item.jsonb ->> 'copyNumber'::text AS item_copy_number,
    (src_inventory_item.jsonb -> 'metadata'::text) ->> 'createdDate'::text AS item_created_date,
    concat((src_inventory_item.jsonb -> 'effectiveCallNumberComponents'::text) ->> 'prefix'::text ,', ', (src_inventory_item.jsonb -> 'effectiveCallNumberComponents'::text) ->> 'callNumber'::text ,', ',src_inventory_item.jsonb ->> 'copyNumber'::text) AS item_effective_call_number,
    call_number_type_ref_data.jsonb ->> 'name'::text AS item_effective_call_number_type_name,
    (src_inventory_item.jsonb -> 'effectiveCallNumberComponents'::text) ->> 'typeId'::text AS item_effective_call_number_typeid,
    loclib_ref_data.jsonb ->> 'code'::text AS item_effective_library_code,
    loclib_ref_data.id AS item_effective_library_id,
    loclib_ref_data.jsonb ->> 'name'::text AS item_effective_library_name,
    src_inventory_item.effectivelocationid AS item_effective_location_id,
    effective_location_ref_data.jsonb ->> 'name'::text AS item_effective_location_name,
    src_inventory_item.jsonb ->> 'hrid'::text AS item_hrid,
    src_inventory_item.holdingsrecordid AS holdings_id,
    src_inventory_item.jsonb ->> 'itemLevelCallNumber'::text AS item_level_call_number,
    call_item_number_type_ref_data.jsonb ->> 'name'::text AS item_level_call_number_type_name,
    src_inventory_item.jsonb ->> 'itemLevelCallNumberTypeId'::text AS item_level_call_number_typeid,
    material_type_ref_data.jsonb ->> 'name'::text AS item_material_type,
    src_inventory_item.materialtypeid AS item_material_type_id,
    src_inventory_item.permanentlocationid AS item_permanent_location_id,
    permanent_location_ref_data.jsonb ->> 'name'::text AS item_permanent_location_name,
    src_inventory_item.temporarylocationid AS item_temporary_location_id,
    temporary_location_ref_data.jsonb ->> 'name'::text AS item_temporary_location_name,
    "left"(lower(f_unaccent((src_inventory_item.jsonb -> 'status'::text) ->> 'name'::text)), 600) AS item_status,
    (src_inventory_item.jsonb -> 'metadata'::text) ->> 'updatedDate'::text AS item_updated_date
   FROM src_inventory_item
     LEFT JOIN src_inventory_location effective_location_ref_data ON effective_location_ref_data.id = src_inventory_item.effectivelocationid
     LEFT JOIN src_inventory_call_number_type call_number_type_ref_data ON call_number_type_ref_data.id::text = ((src_inventory_item.jsonb -> 'effectiveCallNumberComponents'::text) ->> 'typeId'::text)
     LEFT JOIN src_inventory_call_number_type call_item_number_type_ref_data ON call_item_number_type_ref_data.id::text = (src_inventory_item.jsonb ->> 'itemLevelCallNumberTypeId'::text)
     LEFT JOIN src_inventory_loclibrary loclib_ref_data ON loclib_ref_data.id = effective_location_ref_data.libraryid
     LEFT JOIN src_inventory_location permanent_location_ref_data ON permanent_location_ref_data.id = src_inventory_item.permanentlocationid
     LEFT JOIN src_inventory_material_type material_type_ref_data ON material_type_ref_data.id = src_inventory_item.materialtypeid
     LEFT JOIN src_inventory_location temporary_location_ref_data ON temporary_location_ref_data.id = src_inventory_item.temporarylocationid
     JOIN src_inventory_holdings_record hrim ON src_inventory_item.holdingsrecordid = hrim.id
     JOIN src_inventory_instance instance_details ON hrim.instanceid = instance_details.id;
