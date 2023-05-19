process foo {
  input:
  val x

  output:
  path "out-${x}.txt"

  script:
  def fn = "out-${x}.txt"
  """
  echo $x > $fn
  """
}

workflow {
  in = Channel.from(0..9)
  res = foo(in)
  res.view { "[fengsh] result is: ${it}"  }
}



