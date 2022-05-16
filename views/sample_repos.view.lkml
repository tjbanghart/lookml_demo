view: sample_repos {
  sql_table_name: `bigquery-public-data.github_repos.sample_repos`
    ;;

  dimension: repo_name {
    type: string
    sql: ${TABLE}.repo_name ;;
  }

  dimension: watch_count {
    type: number
    sql: ${TABLE}.watch_count ;;
  }

  measure: count {
    type: count
    drill_fields: [repo_name]
  }
}
