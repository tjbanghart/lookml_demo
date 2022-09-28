view: files {
  sql_table_name: `bigquery-public-data.github_repos.files`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: mode {
    type: number
    sql: ${TABLE}.mode ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: ref {
    type: string
    sql: ${TABLE}.ref ;;
  }

  dimension: repo_name {
    type: string
    link: {
      label: "Rep details"
      url: "https://gcps228.cloud.looker.com/dashboards/11?repo_name={{ _filters['files.repo_name'] | url_encode }}"
    }
    sql: ${TABLE}.repo_name ;;
  }

  dimension: symlink_target {
    type: string
    sql: ${TABLE}.symlink_target ;;
  }

  measure: count {
    type: count
    drill_fields: [id, repo_name]
  }
}
