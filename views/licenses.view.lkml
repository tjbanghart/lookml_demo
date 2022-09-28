view: licenses {
  sql_table_name: `bigquery-public-data.github_repos.licenses`
    ;;

  dimension: license {
    type: string
    sql: ${TABLE}.license ;;
  }

  dimension: repo_name {
    type: string
    link: {
      label: "Repo details"
      url: "https://gcps228.cloud.looker.com/explore/github_repos/licenses?fields=licenses.license,licenses.repo_name,licenses.count&f[licenses.repo_name]={{value}}&sorts=licenses.count+desc&limit=500"
    }
    sql: ${TABLE}.repo_name ;;
  }
  measure: count {
    type: count
    drill_fields: [repo_name]
  }
}
