# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'


# Comment the next line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

def weatherDataDemo_pods
#    //inherit! :search_paths
pod 'RxSwift',    '~> 3.0'
pod 'Alamofire', '~> 4.2.0'
pod 'RealmSwift', '~> 3.1'
pod 'SwiftCharts', '0.6'
end

# Pods for WeatherDataDemo
target 'WeatherDataDemo' do
weatherDataDemo_pods
end


target 'WeatherDataDemoTests' do
inherit! :search_paths
# Pods for testing
end

target 'WeatherDataDemoUITests' do
inherit! :search_paths
# Pods for testing
end

