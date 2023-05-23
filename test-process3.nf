process processThemAll {
    input:
    path 'seq'

    "echo seq*"
}

workflow {
    def fasta = Channel.fromPath( "./*.fastq" ).buffer(size: 3)
    processThemAll(fasta)
}
