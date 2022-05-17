include: "/explores/commits.explore"
include: "/explores/languages.explore"

explore: commits_by_language {
  view_name: commits
  extends: [languages, commits]
  join: languages {
    sql_on: ${commits__repo_name.commits__repo_name} = ${languages.repo_name} ;;
    relationship: many_to_many
  }
}
