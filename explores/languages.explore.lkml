include: "/views/languages.view.lkml"

explore: languages {
  join: languages__language {
    view_label: "Languages: Language"
    sql: LEFT JOIN UNNEST(${languages.language}) as languages__language ;;
    relationship: one_to_many
  }
}
