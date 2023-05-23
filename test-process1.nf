process myTask {
    input:
    val str

    shell:
    '''
    echo "User $USER says !{str}"
    '''
}

workflow {
    Channel.of('Hello', 'Hola', 'Bonjour') | myTask
}
