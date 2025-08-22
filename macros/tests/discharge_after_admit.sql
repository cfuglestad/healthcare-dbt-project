{% test discharge_after_admit(model, column_name, admit_col, discharge_col) %}
-- Fails if any discharge occurs before admit (or is null while admit is not)
select *
from {{ model }}
where {{ discharge_col }} is null
   or {{ admit_col }} is null
   or {{ discharge_col }} < {{ admit_col }}
{% endtest %}
