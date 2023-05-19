

workflow {
  Channel
    .fromSRA('SRP043510')
    .view()
}
