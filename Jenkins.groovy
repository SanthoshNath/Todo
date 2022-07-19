pipelineJob('Todo') {
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
            lightweight()
        }
    }
}
