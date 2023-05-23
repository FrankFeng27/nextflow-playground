process blastThemAll {
  input:
  path query_file

  """
  echo [blastThemAll] process `date`
  ls -ahl $query_file
  """
}

process processFixedFile {
  input:
  path 'rRCS.fa'

  """
  echo [processFixedFile] process `date`
  ls -ahl rRCS.fa
  """
}

workflow {
  def proteins = Channel.fromPath( '/users/PCON0100/feng1426/Downloads/chrM/work1/*.fa' )
  blastThemAll(proteins)
  processFixedFile(proteins)
}
