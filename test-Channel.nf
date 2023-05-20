
workflow {
    Channel.from(1, 2, 3, 4, 5, 6).view { "[1] from: $it"  }
    Channel.from([1, 2, 3, 4, 5, 6]).view { "[2] from: $it"  }
    Channel.from([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]).view { "[3] from: $it"  }
    Channel.fromList([1, 2, 3, 4, 5, 6]).view { "[4] fromList: $it"  }
    Channel.fromList([[1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]]).view { "[5] fromList: $it"  }

  Channel
    .fromFilePairs('./SRR*_{1,2}.fastq')
    .view()
  Channel
    .fromFilePairs('./*', size: 2) { file -> file.extension }
    .view { ext, files -> "[7] Files with the extension $ext are $files" }

  expl2 = Channel.value( 'Hello there' )
  expl2.view { "[8] value: $it"  }
  expl3 = Channel.value( [1,2,3,4,5] )
  expl3.view { "[9] value: $it" }
  expl3.subscribe { println "[9.1] value: $it" }

  Channel
    .watchPath( './*.fa' )
    .subscribe { println "Fasta file: $it" }

}

