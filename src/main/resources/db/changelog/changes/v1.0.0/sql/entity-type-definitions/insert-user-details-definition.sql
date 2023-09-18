INSERT INTO entity_type_definition (id, derived_table_name, definition)
    VALUES ('0069cf6f-2833-46db-8a51-8934769b8289','drv_user_details', '{
             "id": "0069cf6f-2833-46db-8a51-8934769b8289",
             "name":"drv_user_details",
             "labelAlias" : "Users",
             "private" : false,
             "columns": [
                {
                      "name": "active",
                      "dataType":{
                        "dataType":"booleanType"
                      },
                      "labelAlias": "User active",
                      "visibleByDefault": false
                },
                {
                      "name": "barcode",
                      "dataType":{
                        "dataType":"stringType"
                      },
                      "labelAlias": "User barcode",
                      "visibleByDefault": true
                },
                {
                      "name": "created_date",
                      "dataType":{
                        "dataType":"dateType"
                      },
                      "labelAlias": "User created date",
                      "visibleByDefault": false
                },
                {
                      "name": "date_of_birth",
                      "dataType":{
                        "dataType":"dateType"
                      },
                      "labelAlias": "User date of birth",
                      "visibleByDefault": false
                },
                {
                      "name": "email",
                      "dataType":{
                        "dataType":"stringType"
                      },
                      "labelAlias": "User email",
                      "visibleByDefault": false
                },
                {
                      "name": "enrollment_date",
                       "dataType":{
                         "dataType":"dateType"
                       },
                       "labelAlias": "User enrollment date",
                       "visibleByDefault": false
                },
                {
                      "name": "expiration_date",
                      "dataType":{
                        "dataType":"dateType"
                      },
                      "labelAlias": "User expiration date",
                      "visibleByDefault": false
                },
                {
                      "name": "external_system_id",
                      "dataType":{
                        "dataType":"stringType"
                      },
                      "labelAlias": "User external system id",
                      "visibleByDefault": false
                },
                 {
                     "name": "first_name",
                     "dataType":{
                       "dataType":"stringType"
                     },
                     "labelAlias": "User first name",
                     "visibleByDefault": true
                 },
                 {
                      "name": "last_name",
                      "dataType":{
                        "dataType":"stringType"
                      },
                      "labelAlias": "User last name",
                      "visibleByDefault": true
                 },
                {
                      "name": "middle_name",
                      "dataType":{
                        "dataType":"stringType"
                      },
                      "labelAlias": "User middle name",
                      "visibleByDefault": false
                },
                 {
                       "name": "mobile_phone",
                       "dataType":{
                         "dataType":"stringType"
                       },
                       "labelAlias": "User mobile phone",
                       "visibleByDefault": false
                 },
                 {
                       "name": "user_patron_group",
                       "dataType":{
                         "dataType":"stringType"
                       },
                       "labelAlias": "User patron group",
                       "visibleByDefault": false,
                       "idColumnName": "user_patron_group_id",
                       "source": {
                          "entityTypeId": "e611264d-377e-4d87-a93f-f1ca327d3db0",
                          "columnName": "group"
                       }
                 },
                 {
                       "name": "user_patron_group_id",
                       "dataType":{
                         "dataType":"rangedUUIDType"
                       },
                       "labelAlias": "User patron group id ",
                       "visibleByDefault": false
                 },
                {
                      "name": "phone",
                      "dataType":{
                        "dataType":"stringType"
                      },
                      "labelAlias": "User phone",
                      "visibleByDefault": true
                },
                 {
                       "name": "preferred_contact_type",
                       "dataType":{
                         "dataType":"stringType"
                       },
                       "labelAlias": "User preferred contact type",
                       "visibleByDefault": false
                },
                {
                       "name": "preferred_contact_type_id",
                       "dataType":{
                         "dataType":"stringType"
                       },
                       "labelAlias": "User preferred contact type ID",
                       "visibleByDefault": false
                 },
                {
                      "name": "preferred_first_name",
                      "dataType":{
                        "dataType":"stringType"
                      },
                      "labelAlias": "User preferred first name",
                      "visibleByDefault": false
                },
                {
                      "name": "id",
                      "dataType":{
                        "dataType":"rangedUUIDType"
                      },
                      "labelAlias": "User id",
                      "visibleByDefault": true
                 },
                {
                      "name": "updated_date",
                      "dataType":{
                        "dataType":"dateType"
                      },
                      "labelAlias": "User updated date",
                      "visibleByDefault": false
                },
                {
                      "name": "username",
                      "dataType":{
                        "dataType":"stringType"
                      },
                      "labelAlias": "Username",
                      "visibleByDefault": true
                },
                {
                      "name": "department_ids",
                      "dataType": {
                        "dataType":"arrayType",
                        "itemDataType": {
                          "dataType": "rangedUUIDType"
                        }
                      },
                      "labelAlias": "Department Ids",
                      "visibleByDefault": false
                },
                {
                      "name": "department_names",
                      "dataType":{
                        "dataType":"arrayType",
                        "itemDataType": {
                          "dataType": "stringType"
                        }
                      },
                      "idColumnName": "department_ids",
                       "source": {
                              "entityTypeId": "c8364551-7e51-475d-8473-88951181452d",
                              "columnName": "department"
                       },
                      "labelAlias": "Department Names",
                      "visibleByDefault": true
                }
             ],
             "defaultSort": [
               {
                   "columnName": "id",
                   "direction": "ASC"
               }
             ]
         }');
