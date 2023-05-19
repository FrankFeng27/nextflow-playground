process foo {
  input:
  val x

  output:
  path 'x.txt'

  """
  echo $x > x.txt
  """
}

workflow { 
  result = foo(1)
  result.view { "[fengsh] Result: ${it}" }
}
