view: contents {
  sql_table_name: `bigquery-public-data.github_repos.contents`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: binary {
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
  }
}
