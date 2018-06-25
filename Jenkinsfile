env.PATH = '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin'
env.HOME = '/Users/iosbuilds'
env.USER = 'iosbuilds'
// backwards compat with old branch variable
env.GIT_BRANCH = env.BRANCH_NAME

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
    //    stage 'Cocoapods Install'
    //    sh "bundle exec fastlane pods"   

         // Mark the code unit tests 'stage'....
         stage 'Tests'
         // reset the simulators before running tests
         sh "killall Simulator || true"
         sh "SNAPSHOT_FORCE_DELETE=yes snapshot reset_simulators"
         sh "fastlane tests"   

         step([$class: 'JUnitResultArchiver', testResults: 'build/reports/*.xml'])
    }
}