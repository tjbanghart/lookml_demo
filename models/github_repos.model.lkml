connection: "bigquery_standard"

# include all the views
include: "/views/**/*.view"

datagroup: github_repos_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: github_repos_default_datagroup

explore: contents {}

explore: languages {
  join: languages__language {
    view_label: "Languages: Language"
    sql: LEFT JOIN UNNEST(${languages.language}) as languages__language ;;
    relationship: one_to_many
  }
}

explore: sample_files {}

explore: licenses {}

explore: sample_commits {
  join: sample_commits__parent {
    view_label: "Sample Commits: Parent"
    sql: LEFT JOIN UNNEST(${sample_commits.parent}) as sample_commits__parent ;;
    relationship: one_to_many
  }

  join: sample_commits__trailer {
    view_label: "Sample Commits: Trailer"
    sql: LEFT JOIN UNNEST(${sample_commits.trailer}) as sample_commits__trailer ;;
    relationship: one_to_many
  }

  join: sample_commits__difference {
    view_label: "Sample Commits: Difference"
    sql: LEFT JOIN UNNEST(${sample_commits.difference}) as sample_commits__difference ;;
    relationship: one_to_many
  }
}

explore: sample_contents {}

explore: sample_repos {}

explore: commits {
  join: commits__parent {
    view_label: "Commits: Parent"
    sql: LEFT JOIN UNNEST(${commits.parent}) as commits__parent ;;
    relationship: one_to_many
  }

  join: commits__trailer {
    view_label: "Commits: Trailer"
    sql: LEFT JOIN UNNEST(${commits.trailer}) as commits__trailer ;;
    relationship: one_to_many
  }

  join: commits__repo_name {
    view_label: "Commits: Repo Name"
    sql: LEFT JOIN UNNEST(${commits.repo_name}) as commits__repo_name ;;
    relationship: one_to_many
  }

  join: commits__difference {
    view_label: "Commits: Difference"
    sql: LEFT JOIN UNNEST(${commits.difference}) as commits__difference ;;
    relationship: one_to_many
  }
}

explore: files {}
