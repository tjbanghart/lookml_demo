include: "/views/commits.view.lkml"

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
