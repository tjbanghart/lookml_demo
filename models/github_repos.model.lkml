connection: "bigquery_standard"

# include all the views
include: "/views/**/*.view"
include: "/explores/**/*.explore"
include: "/analysis/**/*.explore"

# Used for caching and PDT
datagroup: github_repos_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

# Controls cache for all explore queries
persist_with: github_repos_default_datagroup
