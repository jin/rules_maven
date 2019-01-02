GUAVA_JSON_INPUT = """{
  "conflict_resolution": {},
  "dependencies": [
    {
      "coord": "com.google.code.findbugs:jsr305:3.0.2",
      "file": "/Users/username/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar",
      "dependencies": []
    },
    {
      "coord": "com.google.errorprone:error_prone_annotations:2.2.0",
      "file": "/Users/username/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/google/errorprone/error_prone_annotations/2.2.0/error_prone_annotations-2.2.0.jar",
      "dependencies": []
    },
    {
      "coord": "com.google.guava:failureaccess:1.0",
      "file": "/Users/username/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/google/guava/failureaccess/1.0/failureaccess-1.0.jar",
      "dependencies": []
    },
    {
      "coord": "com.google.guava:guava:27.0-jre",
      "file": "/Users/username/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/google/guava/guava/27.0-jre/guava-27.0-jre.jar",
      "dependencies": [
        "com.google.guava:listenablefuture:9999.0-empty-to-avoid-conflict-with-guava",
        "com.google.code.findbugs:jsr305:3.0.2",
        "com.google.guava:failureaccess:1.0",
        "org.codehaus.mojo:animal-sniffer-annotations:1.17",
        "com.google.j2objc:j2objc-annotations:1.1",
        "com.google.errorprone:error_prone_annotations:2.2.0",
        "org.checkerframework:checker-qual:2.5.2"
      ]
    },
    {
      "coord": "com.google.guava:listenablefuture:9999.0-empty-to-avoid-conflict-with-guava",
      "file": "/Users/username/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar",
      "dependencies": []
    },
    {
      "coord": "com.google.j2objc:j2objc-annotations:1.1",
      "file": "/Users/username/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar",
      "dependencies": []
    },
    {
      "coord": "org.checkerframework:checker-qual:2.5.2",
      "file": "/Users/username/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/checkerframework/checker-qual/2.5.2/checker-qual-2.5.2.jar",
      "dependencies": []
    },
    {
      "coord": "org.codehaus.mojo:animal-sniffer-annotations:1.17",
      "file": "/Users/username/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.17/animal-sniffer-annotations-1.17.jar",
      "dependencies": []
    }
  ],
  "version": "0.1.0"
}"""

GUAVA_EXPECTED_BUILD = """java_import(
	name = "com_google_code_findbugs_jsr305_3_0_2",
	jars = ["https/repo1.maven.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar"],
	deps = [
	],
)
java_import(
	name = "com_google_errorprone_error_prone_annotations_2_2_0",
	jars = ["https/repo1.maven.org/maven2/com/google/errorprone/error_prone_annotations/2.2.0/error_prone_annotations-2.2.0.jar"],
	deps = [
	],
)
java_import(
	name = "com_google_guava_failureaccess_1_0",
	jars = ["https/repo1.maven.org/maven2/com/google/guava/failureaccess/1.0/failureaccess-1.0.jar"],
	deps = [
	],
)
java_import(
	name = "com_google_guava_guava_27_0_jre",
	jars = ["https/repo1.maven.org/maven2/com/google/guava/guava/27.0-jre/guava-27.0-jre.jar"],
	deps = [
		":com_google_guava_listenablefuture_9999_0_empty_to_avoid_conflict_with_guava",
		":com_google_code_findbugs_jsr305_3_0_2",
		":com_google_guava_failureaccess_1_0",
		":org_codehaus_mojo_animal_sniffer_annotations_1_17",
		":com_google_j2objc_j2objc_annotations_1_1",
		":com_google_errorprone_error_prone_annotations_2_2_0",
		":org_checkerframework_checker_qual_2_5_2",
	],
)
java_import(
	name = "com_google_guava_listenablefuture_9999_0_empty_to_avoid_conflict_with_guava",
	jars = ["https/repo1.maven.org/maven2/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar"],
	deps = [
	],
)
java_import(
	name = "com_google_j2objc_j2objc_annotations_1_1",
	jars = ["https/repo1.maven.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar"],
	deps = [
	],
)
java_import(
	name = "org_checkerframework_checker_qual_2_5_2",
	jars = ["https/repo1.maven.org/maven2/org/checkerframework/checker-qual/2.5.2/checker-qual-2.5.2.jar"],
	deps = [
	],
)
java_import(
	name = "org_codehaus_mojo_animal_sniffer_annotations_1_17",
	jars = ["https/repo1.maven.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.17/animal-sniffer-annotations-1.17.jar"],
	deps = [
	],
)"""

ANDROID_DESIGN_JSON_INPUT = """{
  "conflict_resolution": {},
  "dependencies": [
    {
      "coord": "android.arch.core:common:1.1.1",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/android/arch/core/common/1.1.1/common-1.1.1.jar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0"
      ]
    },
    {
      "coord": "android.arch.core:runtime:aar:1.1.1",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/android/arch/core/runtime/1.1.1/runtime-1.1.1.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "android.arch.lifecycle:common:1.1.1",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/android/arch/lifecycle/common/1.1.1/common-1.1.1.jar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0"
      ]
    },
    {
      "coord": "android.arch.lifecycle:livedata-core:aar:1.1.1",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/android/arch/lifecycle/livedata-core/1.1.1/livedata-core-1.1.1.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:common:1.1.1",
        "android.arch.core:runtime:aar:1.1.1",
        "android.arch.lifecycle:common:1.1.1"
      ]
    },
    {
      "coord": "android.arch.lifecycle:livedata:aar:1.1.1",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/android/arch/lifecycle/livedata/1.1.1/livedata-1.1.1.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:runtime:aar:1.1.1",
        "android.arch.lifecycle:livedata-core:aar:1.1.1",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "android.arch.lifecycle:runtime:aar:1.1.1",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/android/arch/lifecycle/runtime/1.1.1/runtime-1.1.1.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:common:1.1.1",
        "android.arch.lifecycle:common:1.1.1"
      ]
    },
    {
      "coord": "android.arch.lifecycle:viewmodel:aar:1.1.1",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/android/arch/lifecycle/viewmodel/1.1.1/viewmodel-1.1.1.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0"
      ]
    },
    {
      "coord": "com.android.support:animated-vector-drawable:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/animated-vector-drawable/28.0.0/animated-vector-drawable-28.0.0.aar",
      "dependencies": [
        "android.arch.lifecycle:viewmodel:aar:1.1.1",
        "com.android.support:customview:aar:28.0.0",
        "com.android.support:print:aar:28.0.0",
        "com.android.support:asynclayoutinflater:aar:28.0.0",
        "com.android.support:support-core-utils:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:viewpager:aar:28.0.0",
        "com.android.support:support-vector-drawable:aar:28.0.0",
        "com.android.support:interpolator:aar:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "com.android.support:support-core-ui:aar:28.0.0",
        "com.android.support:swiperefreshlayout:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:runtime:aar:1.1.1",
        "com.android.support:coordinatorlayout:aar:28.0.0",
        "com.android.support:loader:aar:28.0.0",
        "android.arch.lifecycle:livedata:aar:1.1.1",
        "com.android.support:support-compat:aar:28.0.0",
        "com.android.support:localbroadcastmanager:aar:28.0.0",
        "com.android.support:cursoradapter:aar:28.0.0",
        "com.android.support:drawerlayout:aar:28.0.0",
        "android.arch.lifecycle:livedata-core:aar:1.1.1",
        "android.arch.lifecycle:common:1.1.1",
        "com.android.support:slidingpanelayout:aar:28.0.0",
        "com.android.support:documentfile:aar:28.0.0",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:appcompat-v7:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/appcompat-v7/28.0.0/appcompat-v7-28.0.0.aar",
      "dependencies": [
        "android.arch.lifecycle:viewmodel:aar:1.1.1",
        "com.android.support:customview:aar:28.0.0",
        "com.android.support:animated-vector-drawable:aar:28.0.0",
        "com.android.support:print:aar:28.0.0",
        "com.android.support:asynclayoutinflater:aar:28.0.0",
        "com.android.support:support-core-utils:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:support-fragment:aar:28.0.0",
        "com.android.support:viewpager:aar:28.0.0",
        "com.android.support:support-vector-drawable:aar:28.0.0",
        "com.android.support:interpolator:aar:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "com.android.support:support-core-ui:aar:28.0.0",
        "com.android.support:swiperefreshlayout:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:runtime:aar:1.1.1",
        "com.android.support:coordinatorlayout:aar:28.0.0",
        "com.android.support:loader:aar:28.0.0",
        "android.arch.lifecycle:livedata:aar:1.1.1",
        "com.android.support:support-compat:aar:28.0.0",
        "com.android.support:localbroadcastmanager:aar:28.0.0",
        "com.android.support:cursoradapter:aar:28.0.0",
        "com.android.support:drawerlayout:aar:28.0.0",
        "android.arch.lifecycle:livedata-core:aar:1.1.1",
        "android.arch.lifecycle:common:1.1.1",
        "com.android.support:slidingpanelayout:aar:28.0.0",
        "com.android.support:documentfile:aar:28.0.0",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:asynclayoutinflater:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/asynclayoutinflater/28.0.0/asynclayoutinflater-28.0.0.aar",
      "dependencies": [
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "com.android.support:support-compat:aar:28.0.0",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:cardview-v7:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/cardview-v7/28.0.0/cardview-v7-28.0.0.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0"
      ]
    },
    {
      "coord": "com.android.support:collections:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/collections/28.0.0/collections-28.0.0.jar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0"
      ]
    },
    {
      "coord": "com.android.support:coordinatorlayout:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/coordinatorlayout/28.0.0/coordinatorlayout-28.0.0.aar",
      "dependencies": [
        "com.android.support:customview:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "com.android.support:support-compat:aar:28.0.0",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:cursoradapter:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/cursoradapter/28.0.0/cursoradapter-28.0.0.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0"
      ]
    },
    {
      "coord": "com.android.support:customview:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/customview/28.0.0/customview-28.0.0.aar",
      "dependencies": [
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "com.android.support:support-compat:aar:28.0.0",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:design:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/design/28.0.0/design-28.0.0.aar",
      "dependencies": [
        "android.arch.lifecycle:viewmodel:aar:1.1.1",
        "com.android.support:customview:aar:28.0.0",
        "com.android.support:animated-vector-drawable:aar:28.0.0",
        "com.android.support:print:aar:28.0.0",
        "com.android.support:asynclayoutinflater:aar:28.0.0",
        "com.android.support:support-core-utils:aar:28.0.0",
        "com.android.support:cardview-v7:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:support-fragment:aar:28.0.0",
        "com.android.support:viewpager:aar:28.0.0",
        "com.android.support:support-vector-drawable:aar:28.0.0",
        "com.android.support:interpolator:aar:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "com.android.support:support-core-ui:aar:28.0.0",
        "com.android.support:swiperefreshlayout:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:runtime:aar:1.1.1",
        "com.android.support:coordinatorlayout:aar:28.0.0",
        "com.android.support:loader:aar:28.0.0",
        "com.android.support:appcompat-v7:aar:28.0.0",
        "android.arch.lifecycle:livedata:aar:1.1.1",
        "com.android.support:support-compat:aar:28.0.0",
        "com.android.support:localbroadcastmanager:aar:28.0.0",
        "com.android.support:recyclerview-v7:aar:28.0.0",
        "com.android.support:cursoradapter:aar:28.0.0",
        "com.android.support:drawerlayout:aar:28.0.0",
        "com.android.support:transition:aar:28.0.0",
        "android.arch.lifecycle:livedata-core:aar:1.1.1",
        "android.arch.lifecycle:common:1.1.1",
        "com.android.support:slidingpanelayout:aar:28.0.0",
        "com.android.support:documentfile:aar:28.0.0",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:documentfile:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/documentfile/28.0.0/documentfile-28.0.0.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0"
      ]
    },
    {
      "coord": "com.android.support:drawerlayout:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/drawerlayout/28.0.0/drawerlayout-28.0.0.aar",
      "dependencies": [
        "com.android.support:customview:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "com.android.support:support-compat:aar:28.0.0",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:interpolator:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/interpolator/28.0.0/interpolator-28.0.0.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0"
      ]
    },
    {
      "coord": "com.android.support:loader:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/loader/28.0.0/loader-28.0.0.aar",
      "dependencies": [
        "android.arch.lifecycle:viewmodel:aar:1.1.1",
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:runtime:aar:1.1.1",
        "android.arch.lifecycle:livedata:aar:1.1.1",
        "com.android.support:support-compat:aar:28.0.0",
        "android.arch.lifecycle:livedata-core:aar:1.1.1",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:localbroadcastmanager:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/localbroadcastmanager/28.0.0/localbroadcastmanager-28.0.0.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0"
      ]
    },
    {
      "coord": "com.android.support:print:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/print/28.0.0/print-28.0.0.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0"
      ]
    },
    {
      "coord": "com.android.support:recyclerview-v7:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/recyclerview-v7/28.0.0/recyclerview-v7-28.0.0.aar",
      "dependencies": [
        "android.arch.lifecycle:viewmodel:aar:1.1.1",
        "com.android.support:customview:aar:28.0.0",
        "com.android.support:print:aar:28.0.0",
        "com.android.support:asynclayoutinflater:aar:28.0.0",
        "com.android.support:support-core-utils:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:viewpager:aar:28.0.0",
        "com.android.support:interpolator:aar:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "com.android.support:support-core-ui:aar:28.0.0",
        "com.android.support:swiperefreshlayout:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:runtime:aar:1.1.1",
        "com.android.support:coordinatorlayout:aar:28.0.0",
        "com.android.support:loader:aar:28.0.0",
        "android.arch.lifecycle:livedata:aar:1.1.1",
        "com.android.support:support-compat:aar:28.0.0",
        "com.android.support:localbroadcastmanager:aar:28.0.0",
        "com.android.support:cursoradapter:aar:28.0.0",
        "com.android.support:drawerlayout:aar:28.0.0",
        "android.arch.lifecycle:livedata-core:aar:1.1.1",
        "android.arch.lifecycle:common:1.1.1",
        "com.android.support:slidingpanelayout:aar:28.0.0",
        "com.android.support:documentfile:aar:28.0.0",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:slidingpanelayout:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/slidingpanelayout/28.0.0/slidingpanelayout-28.0.0.aar",
      "dependencies": [
        "com.android.support:customview:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "com.android.support:support-compat:aar:28.0.0",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:support-annotations:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/support-annotations/28.0.0/support-annotations-28.0.0.jar",
      "dependencies": []
    },
    {
      "coord": "com.android.support:support-compat:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/support-compat/28.0.0/support-compat-28.0.0.aar",
      "dependencies": [
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:support-core-ui:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/support-core-ui/28.0.0/support-core-ui-28.0.0.aar",
      "dependencies": [
        "android.arch.lifecycle:viewmodel:aar:1.1.1",
        "com.android.support:customview:aar:28.0.0",
        "com.android.support:print:aar:28.0.0",
        "com.android.support:asynclayoutinflater:aar:28.0.0",
        "com.android.support:support-core-utils:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:viewpager:aar:28.0.0",
        "com.android.support:interpolator:aar:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "com.android.support:swiperefreshlayout:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:runtime:aar:1.1.1",
        "com.android.support:coordinatorlayout:aar:28.0.0",
        "com.android.support:loader:aar:28.0.0",
        "android.arch.lifecycle:livedata:aar:1.1.1",
        "com.android.support:support-compat:aar:28.0.0",
        "com.android.support:localbroadcastmanager:aar:28.0.0",
        "com.android.support:cursoradapter:aar:28.0.0",
        "com.android.support:drawerlayout:aar:28.0.0",
        "android.arch.lifecycle:livedata-core:aar:1.1.1",
        "android.arch.lifecycle:common:1.1.1",
        "com.android.support:slidingpanelayout:aar:28.0.0",
        "com.android.support:documentfile:aar:28.0.0",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:support-core-utils:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/support-core-utils/28.0.0/support-core-utils-28.0.0.aar",
      "dependencies": [
        "android.arch.lifecycle:viewmodel:aar:1.1.1",
        "com.android.support:print:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:runtime:aar:1.1.1",
        "com.android.support:loader:aar:28.0.0",
        "android.arch.lifecycle:livedata:aar:1.1.1",
        "com.android.support:support-compat:aar:28.0.0",
        "com.android.support:localbroadcastmanager:aar:28.0.0",
        "android.arch.lifecycle:livedata-core:aar:1.1.1",
        "android.arch.lifecycle:common:1.1.1",
        "com.android.support:documentfile:aar:28.0.0",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:support-fragment:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/support-fragment/28.0.0/support-fragment-28.0.0.aar",
      "dependencies": [
        "android.arch.lifecycle:viewmodel:aar:1.1.1",
        "com.android.support:customview:aar:28.0.0",
        "com.android.support:print:aar:28.0.0",
        "com.android.support:asynclayoutinflater:aar:28.0.0",
        "com.android.support:support-core-utils:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:viewpager:aar:28.0.0",
        "com.android.support:interpolator:aar:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "com.android.support:support-core-ui:aar:28.0.0",
        "com.android.support:swiperefreshlayout:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "android.arch.core:runtime:aar:1.1.1",
        "com.android.support:coordinatorlayout:aar:28.0.0",
        "com.android.support:loader:aar:28.0.0",
        "android.arch.lifecycle:livedata:aar:1.1.1",
        "com.android.support:support-compat:aar:28.0.0",
        "com.android.support:localbroadcastmanager:aar:28.0.0",
        "com.android.support:cursoradapter:aar:28.0.0",
        "com.android.support:drawerlayout:aar:28.0.0",
        "android.arch.lifecycle:livedata-core:aar:1.1.1",
        "android.arch.lifecycle:common:1.1.1",
        "com.android.support:slidingpanelayout:aar:28.0.0",
        "com.android.support:documentfile:aar:28.0.0",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:support-vector-drawable:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/support-vector-drawable/28.0.0/support-vector-drawable-28.0.0.aar",
      "dependencies": [
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "com.android.support:support-compat:aar:28.0.0",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:swiperefreshlayout:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/swiperefreshlayout/28.0.0/swiperefreshlayout-28.0.0.aar",
      "dependencies": [
        "com.android.support:collections:28.0.0",
        "com.android.support:interpolator:aar:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "com.android.support:support-compat:aar:28.0.0",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:transition:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/transition/28.0.0/transition-28.0.0.aar",
      "dependencies": [
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "com.android.support:support-compat:aar:28.0.0",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    },
    {
      "coord": "com.android.support:versionedparcelable:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/versionedparcelable/28.0.0/versionedparcelable-28.0.0.aar",
      "dependencies": [
        "com.android.support:support-annotations:28.0.0",
        "com.android.support:collections:28.0.0"
      ]
    },
    {
      "coord": "com.android.support:viewpager:aar:28.0.0",
      "file": "/Users/jin/Library/Caches/Coursier/v1/https/maven.google.com/com/android/support/viewpager/28.0.0/viewpager-28.0.0.aar",
      "dependencies": [
        "com.android.support:customview:aar:28.0.0",
        "com.android.support:collections:28.0.0",
        "com.android.support:versionedparcelable:aar:28.0.0",
        "android.arch.lifecycle:runtime:aar:1.1.1",
        "com.android.support:support-annotations:28.0.0",
        "com.android.support:support-compat:aar:28.0.0",
        "android.arch.lifecycle:common:1.1.1",
        "android.arch.core:common:1.1.1"
      ]
    }
  ],
  "version": "0.1.0"
}"""

ANDROID_DESIGN_EXPECTED_BUILD = """java_import(
	name = "android_arch_core_common_1_1_1",
	jars = ["https/maven.google.com/android/arch/core/common/1.1.1/common-1.1.1.jar"],
	deps = [
		":com_android_support_support_annotations_28_0_0",
	],
)
aar_import(
	name = "android_arch_core_runtime_1_1_1",
	aar = "https/maven.google.com/android/arch/core/runtime/1.1.1/runtime-1.1.1.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_common_1_1_1",
	],
)
java_import(
	name = "android_arch_lifecycle_common_1_1_1",
	jars = ["https/maven.google.com/android/arch/lifecycle/common/1.1.1/common-1.1.1.jar"],
	deps = [
		":com_android_support_support_annotations_28_0_0",
	],
)
aar_import(
	name = "android_arch_lifecycle_livedata_core_1_1_1",
	aar = "https/maven.google.com/android/arch/lifecycle/livedata-core/1.1.1/livedata-core-1.1.1.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_common_1_1_1",
		":android_arch_core_runtime_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
	],
)
aar_import(
	name = "android_arch_lifecycle_livedata_1_1_1",
	aar = "https/maven.google.com/android/arch/lifecycle/livedata/1.1.1/livedata-1.1.1.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_runtime_1_1_1",
		":android_arch_lifecycle_livedata_core_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "android_arch_lifecycle_runtime_1_1_1",
	aar = "https/maven.google.com/android/arch/lifecycle/runtime/1.1.1/runtime-1.1.1.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_common_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
	],
)
aar_import(
	name = "android_arch_lifecycle_viewmodel_1_1_1",
	aar = "https/maven.google.com/android/arch/lifecycle/viewmodel/1.1.1/viewmodel-1.1.1.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
	],
)
aar_import(
	name = "com_android_support_animated_vector_drawable_28_0_0",
	aar = "https/maven.google.com/com/android/support/animated-vector-drawable/28.0.0/animated-vector-drawable-28.0.0.aar",
	deps = [
		":android_arch_lifecycle_viewmodel_1_1_1",
		":com_android_support_customview_28_0_0",
		":com_android_support_print_28_0_0",
		":com_android_support_asynclayoutinflater_28_0_0",
		":com_android_support_support_core_utils_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_viewpager_28_0_0",
		":com_android_support_support_vector_drawable_28_0_0",
		":com_android_support_interpolator_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":com_android_support_support_core_ui_28_0_0",
		":com_android_support_swiperefreshlayout_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_runtime_1_1_1",
		":com_android_support_coordinatorlayout_28_0_0",
		":com_android_support_loader_28_0_0",
		":android_arch_lifecycle_livedata_1_1_1",
		":com_android_support_support_compat_28_0_0",
		":com_android_support_localbroadcastmanager_28_0_0",
		":com_android_support_cursoradapter_28_0_0",
		":com_android_support_drawerlayout_28_0_0",
		":android_arch_lifecycle_livedata_core_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
		":com_android_support_slidingpanelayout_28_0_0",
		":com_android_support_documentfile_28_0_0",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_appcompat_v7_28_0_0",
	aar = "https/maven.google.com/com/android/support/appcompat-v7/28.0.0/appcompat-v7-28.0.0.aar",
	deps = [
		":android_arch_lifecycle_viewmodel_1_1_1",
		":com_android_support_customview_28_0_0",
		":com_android_support_animated_vector_drawable_28_0_0",
		":com_android_support_print_28_0_0",
		":com_android_support_asynclayoutinflater_28_0_0",
		":com_android_support_support_core_utils_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_support_fragment_28_0_0",
		":com_android_support_viewpager_28_0_0",
		":com_android_support_support_vector_drawable_28_0_0",
		":com_android_support_interpolator_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":com_android_support_support_core_ui_28_0_0",
		":com_android_support_swiperefreshlayout_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_runtime_1_1_1",
		":com_android_support_coordinatorlayout_28_0_0",
		":com_android_support_loader_28_0_0",
		":android_arch_lifecycle_livedata_1_1_1",
		":com_android_support_support_compat_28_0_0",
		":com_android_support_localbroadcastmanager_28_0_0",
		":com_android_support_cursoradapter_28_0_0",
		":com_android_support_drawerlayout_28_0_0",
		":android_arch_lifecycle_livedata_core_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
		":com_android_support_slidingpanelayout_28_0_0",
		":com_android_support_documentfile_28_0_0",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_asynclayoutinflater_28_0_0",
	aar = "https/maven.google.com/com/android/support/asynclayoutinflater/28.0.0/asynclayoutinflater-28.0.0.aar",
	deps = [
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":com_android_support_support_compat_28_0_0",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_cardview_v7_28_0_0",
	aar = "https/maven.google.com/com/android/support/cardview-v7/28.0.0/cardview-v7-28.0.0.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
	],
)
java_import(
	name = "com_android_support_collections_28_0_0",
	jars = ["https/maven.google.com/com/android/support/collections/28.0.0/collections-28.0.0.jar"],
	deps = [
		":com_android_support_support_annotations_28_0_0",
	],
)
aar_import(
	name = "com_android_support_coordinatorlayout_28_0_0",
	aar = "https/maven.google.com/com/android/support/coordinatorlayout/28.0.0/coordinatorlayout-28.0.0.aar",
	deps = [
		":com_android_support_customview_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":com_android_support_support_compat_28_0_0",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_cursoradapter_28_0_0",
	aar = "https/maven.google.com/com/android/support/cursoradapter/28.0.0/cursoradapter-28.0.0.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
	],
)
aar_import(
	name = "com_android_support_customview_28_0_0",
	aar = "https/maven.google.com/com/android/support/customview/28.0.0/customview-28.0.0.aar",
	deps = [
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":com_android_support_support_compat_28_0_0",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_design_28_0_0",
	aar = "https/maven.google.com/com/android/support/design/28.0.0/design-28.0.0.aar",
	deps = [
		":android_arch_lifecycle_viewmodel_1_1_1",
		":com_android_support_customview_28_0_0",
		":com_android_support_animated_vector_drawable_28_0_0",
		":com_android_support_print_28_0_0",
		":com_android_support_asynclayoutinflater_28_0_0",
		":com_android_support_support_core_utils_28_0_0",
		":com_android_support_cardview_v7_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_support_fragment_28_0_0",
		":com_android_support_viewpager_28_0_0",
		":com_android_support_support_vector_drawable_28_0_0",
		":com_android_support_interpolator_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":com_android_support_support_core_ui_28_0_0",
		":com_android_support_swiperefreshlayout_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_runtime_1_1_1",
		":com_android_support_coordinatorlayout_28_0_0",
		":com_android_support_loader_28_0_0",
		":com_android_support_appcompat_v7_28_0_0",
		":android_arch_lifecycle_livedata_1_1_1",
		":com_android_support_support_compat_28_0_0",
		":com_android_support_localbroadcastmanager_28_0_0",
		":com_android_support_recyclerview_v7_28_0_0",
		":com_android_support_cursoradapter_28_0_0",
		":com_android_support_drawerlayout_28_0_0",
		":com_android_support_transition_28_0_0",
		":android_arch_lifecycle_livedata_core_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
		":com_android_support_slidingpanelayout_28_0_0",
		":com_android_support_documentfile_28_0_0",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_documentfile_28_0_0",
	aar = "https/maven.google.com/com/android/support/documentfile/28.0.0/documentfile-28.0.0.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
	],
)
aar_import(
	name = "com_android_support_drawerlayout_28_0_0",
	aar = "https/maven.google.com/com/android/support/drawerlayout/28.0.0/drawerlayout-28.0.0.aar",
	deps = [
		":com_android_support_customview_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":com_android_support_support_compat_28_0_0",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_interpolator_28_0_0",
	aar = "https/maven.google.com/com/android/support/interpolator/28.0.0/interpolator-28.0.0.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
	],
)
aar_import(
	name = "com_android_support_loader_28_0_0",
	aar = "https/maven.google.com/com/android/support/loader/28.0.0/loader-28.0.0.aar",
	deps = [
		":android_arch_lifecycle_viewmodel_1_1_1",
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_runtime_1_1_1",
		":android_arch_lifecycle_livedata_1_1_1",
		":com_android_support_support_compat_28_0_0",
		":android_arch_lifecycle_livedata_core_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_localbroadcastmanager_28_0_0",
	aar = "https/maven.google.com/com/android/support/localbroadcastmanager/28.0.0/localbroadcastmanager-28.0.0.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
	],
)
aar_import(
	name = "com_android_support_print_28_0_0",
	aar = "https/maven.google.com/com/android/support/print/28.0.0/print-28.0.0.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
	],
)
aar_import(
	name = "com_android_support_recyclerview_v7_28_0_0",
	aar = "https/maven.google.com/com/android/support/recyclerview-v7/28.0.0/recyclerview-v7-28.0.0.aar",
	deps = [
		":android_arch_lifecycle_viewmodel_1_1_1",
		":com_android_support_customview_28_0_0",
		":com_android_support_print_28_0_0",
		":com_android_support_asynclayoutinflater_28_0_0",
		":com_android_support_support_core_utils_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_viewpager_28_0_0",
		":com_android_support_interpolator_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":com_android_support_support_core_ui_28_0_0",
		":com_android_support_swiperefreshlayout_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_runtime_1_1_1",
		":com_android_support_coordinatorlayout_28_0_0",
		":com_android_support_loader_28_0_0",
		":android_arch_lifecycle_livedata_1_1_1",
		":com_android_support_support_compat_28_0_0",
		":com_android_support_localbroadcastmanager_28_0_0",
		":com_android_support_cursoradapter_28_0_0",
		":com_android_support_drawerlayout_28_0_0",
		":android_arch_lifecycle_livedata_core_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
		":com_android_support_slidingpanelayout_28_0_0",
		":com_android_support_documentfile_28_0_0",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_slidingpanelayout_28_0_0",
	aar = "https/maven.google.com/com/android/support/slidingpanelayout/28.0.0/slidingpanelayout-28.0.0.aar",
	deps = [
		":com_android_support_customview_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":com_android_support_support_compat_28_0_0",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
java_import(
	name = "com_android_support_support_annotations_28_0_0",
	jars = ["https/maven.google.com/com/android/support/support-annotations/28.0.0/support-annotations-28.0.0.jar"],
	deps = [
	],
)
aar_import(
	name = "com_android_support_support_compat_28_0_0",
	aar = "https/maven.google.com/com/android/support/support-compat/28.0.0/support-compat-28.0.0.aar",
	deps = [
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_support_core_ui_28_0_0",
	aar = "https/maven.google.com/com/android/support/support-core-ui/28.0.0/support-core-ui-28.0.0.aar",
	deps = [
		":android_arch_lifecycle_viewmodel_1_1_1",
		":com_android_support_customview_28_0_0",
		":com_android_support_print_28_0_0",
		":com_android_support_asynclayoutinflater_28_0_0",
		":com_android_support_support_core_utils_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_viewpager_28_0_0",
		":com_android_support_interpolator_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":com_android_support_swiperefreshlayout_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_runtime_1_1_1",
		":com_android_support_coordinatorlayout_28_0_0",
		":com_android_support_loader_28_0_0",
		":android_arch_lifecycle_livedata_1_1_1",
		":com_android_support_support_compat_28_0_0",
		":com_android_support_localbroadcastmanager_28_0_0",
		":com_android_support_cursoradapter_28_0_0",
		":com_android_support_drawerlayout_28_0_0",
		":android_arch_lifecycle_livedata_core_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
		":com_android_support_slidingpanelayout_28_0_0",
		":com_android_support_documentfile_28_0_0",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_support_core_utils_28_0_0",
	aar = "https/maven.google.com/com/android/support/support-core-utils/28.0.0/support-core-utils-28.0.0.aar",
	deps = [
		":android_arch_lifecycle_viewmodel_1_1_1",
		":com_android_support_print_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_runtime_1_1_1",
		":com_android_support_loader_28_0_0",
		":android_arch_lifecycle_livedata_1_1_1",
		":com_android_support_support_compat_28_0_0",
		":com_android_support_localbroadcastmanager_28_0_0",
		":android_arch_lifecycle_livedata_core_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
		":com_android_support_documentfile_28_0_0",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_support_fragment_28_0_0",
	aar = "https/maven.google.com/com/android/support/support-fragment/28.0.0/support-fragment-28.0.0.aar",
	deps = [
		":android_arch_lifecycle_viewmodel_1_1_1",
		":com_android_support_customview_28_0_0",
		":com_android_support_print_28_0_0",
		":com_android_support_asynclayoutinflater_28_0_0",
		":com_android_support_support_core_utils_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_viewpager_28_0_0",
		":com_android_support_interpolator_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":com_android_support_support_core_ui_28_0_0",
		":com_android_support_swiperefreshlayout_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":android_arch_core_runtime_1_1_1",
		":com_android_support_coordinatorlayout_28_0_0",
		":com_android_support_loader_28_0_0",
		":android_arch_lifecycle_livedata_1_1_1",
		":com_android_support_support_compat_28_0_0",
		":com_android_support_localbroadcastmanager_28_0_0",
		":com_android_support_cursoradapter_28_0_0",
		":com_android_support_drawerlayout_28_0_0",
		":android_arch_lifecycle_livedata_core_1_1_1",
		":android_arch_lifecycle_common_1_1_1",
		":com_android_support_slidingpanelayout_28_0_0",
		":com_android_support_documentfile_28_0_0",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_support_vector_drawable_28_0_0",
	aar = "https/maven.google.com/com/android/support/support-vector-drawable/28.0.0/support-vector-drawable-28.0.0.aar",
	deps = [
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":com_android_support_support_compat_28_0_0",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_swiperefreshlayout_28_0_0",
	aar = "https/maven.google.com/com/android/support/swiperefreshlayout/28.0.0/swiperefreshlayout-28.0.0.aar",
	deps = [
		":com_android_support_collections_28_0_0",
		":com_android_support_interpolator_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":com_android_support_support_compat_28_0_0",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_transition_28_0_0",
	aar = "https/maven.google.com/com/android/support/transition/28.0.0/transition-28.0.0.aar",
	deps = [
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":com_android_support_support_compat_28_0_0",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)
aar_import(
	name = "com_android_support_versionedparcelable_28_0_0",
	aar = "https/maven.google.com/com/android/support/versionedparcelable/28.0.0/versionedparcelable-28.0.0.aar",
	deps = [
		":com_android_support_support_annotations_28_0_0",
		":com_android_support_collections_28_0_0",
	],
)
aar_import(
	name = "com_android_support_viewpager_28_0_0",
	aar = "https/maven.google.com/com/android/support/viewpager/28.0.0/viewpager-28.0.0.aar",
	deps = [
		":com_android_support_customview_28_0_0",
		":com_android_support_collections_28_0_0",
		":com_android_support_versionedparcelable_28_0_0",
		":android_arch_lifecycle_runtime_1_1_1",
		":com_android_support_support_annotations_28_0_0",
		":com_android_support_support_compat_28_0_0",
		":android_arch_lifecycle_common_1_1_1",
		":android_arch_core_common_1_1_1",
	],
)"""

TEST_PAIRS = [
    (GUAVA_JSON_INPUT, GUAVA_EXPECTED_BUILD),
    (ANDROID_DESIGN_JSON_INPUT, ANDROID_DESIGN_EXPECTED_BUILD),
]
