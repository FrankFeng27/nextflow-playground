process perlTask {
    """
    #!/usr/bin/perl

    print 'Hi there!' . '\n';
    """
}

process pythonTask {
    """
    #!/usr/bin/python

    x = 'Hello'
    y = 'world!'
    print "%s - %s" % (x,y)
    """
}

process templateExample {
    input:
    val STR

    script:
    template 'template-sample.sh'
}

workflow {
    // perlTask()
    // pythonTask()
    Channel.of("This", "That") |  templateExample
}
