view: contents {
  sql_table_name: `bigquery-public-data.github_repos.contents`;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    html:
    {% if value > 10 %}
      <font color="darkgreen">{{ id._rendered_value }}</font>
    {% elsif value > 11 %}
      <font color="goldenrod">{{ id._rendered_value }}</font>
    {% else %}
      <font color="darkred">{{ id._rendered_value }}</font>
    {% endif %} ;;
  }
  dimension: content_id_image {
    sql: ${id};;
    html: <img src="https://cdn.freebiesupply.com/logos/large/2x/looker-logo-png-transparent{{value}}.png"/>;;
  }
    dimension: binary {
    description: "Contents"
    type: yesno
    sql: ${TABLE}.binary ;;
  }
  dimension: content {
    description: "content detail"
    type: string
    sql: ${TABLE}.content ;;
  }

  dimension: copies {
    type: number
    sql: ${TABLE}.copies ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
    html:
    {% if copies._value == 'complete'  %}

    <p style="color: black; background-color: pink; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif copies._value == 'pending' %}

    <p style="color: black; background-color: black; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% else %}

    <p style="color: black; background-color: black; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% endif %};;
 }
}
