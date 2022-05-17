include: "/views/commits.view.lkml"

view: +commits {
  dimension_group: commit {
    sql: TIMESTAMP_SECONDS(${commit.committer__date__seconds}) ;;
    type: time
    datatype: timestamp
    timeframes: [
      date,
      day_of_week,
      month,
      year
    ]
  }
}
