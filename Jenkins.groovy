pipelineJob('Todo/todo') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/SanthoshNath/Todo')
                    }
                    branch('*/master')
                }
            }
            lightweight(true)
        }
    }
}
