env.PATH = '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin'
env.HOME = '/Users/iosbuilds'
env.USER = 'iosbuilds'
// backwards compat with old branch variable
env.GIT_BRANCH = env.BRANCH_NAME


def getWorkspace() {
    pwd().replace("%2F", "_")
}

def wipeWorkspace(String workspace) {
    if (workspace) {
        sh "find ${workspace} -mindepth 4 -depth -delete"
    }
}

def isRelease() {
    if (env.RELEASE == "true") {
      return true
    }
}

node {
try {
     // Manually set the workspace to deal with clang 
     // choking on %2f in the directory
     ws(getWorkspace()) {
       wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'XTerm', 'defaultFg': 1, 'defaultBg': 2]) {
         workspace = pwd()
         // Wipe the workspace so we are building completely clean
         wipeWorkspace(workspace) 
         // Mark the code checkout 'stage'....
         stage 'Checkout'
         // Checkout code from repository
         checkout scm
         // Copy nutrition database into place
         sh "cp ${workspace}/../nutrition.db ${workspace}/Nutrition/Nutrition/nutrition.db"

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
  } catch (e) {
    slackSend channel: '#ios', color: 'danger', message: ":dizzy_face: Build failed ${env.JOB_NAME} (${env.BUILD_NUMBER})\n${env.BUILD_URL}"
    throw e
  }
}