node {
    stage('Checkout/Build/Test') {
        // Checkout files.
        checkout([
            $class: 'GitSCM',
            branches: [[name: 'master']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[
                name: 'hannatest',
                url: 'https://github.com/VarunRaj94/hannatest.git/'
            ]]
        ])
        
         // Mark the cocoapods 'stage'....
         stage 'Cocoapods Install'
         sh "fastlane pods"   

         // Mark the code unit tests 'stage'....
         stage 'Tests'
         // reset the simulators before running tests
         sh "killall Simulator || true"
         sh "SNAPSHOT_FORCE_DELETE=yes snapshot reset_simulators"
         sh "fastlane tests"   

         step([$class: 'JUnitResultArchiver', testResults: 'build/reports/*.xml'])
    }
}