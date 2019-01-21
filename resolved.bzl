resolved = [
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/crosstool",
            "actual": "@bazel_tools//tools/cpp:toolchain"
        },
        "native": "bind(name = \"android/crosstool\", actual = \"@bazel_tools//tools/cpp:toolchain\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/dx_jar_import",
            "actual": "@androidsdk//:dx_jar_import"
        },
        "native": "bind(name = \"android/dx_jar_import\", actual = \"@androidsdk//:dx_jar_import\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/sdk",
            "actual": "@androidsdk//:sdk"
        },
        "native": "bind(name = \"android/sdk\", actual = \"@androidsdk//:sdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android_ndk_for_testing",
            "actual": "//:dummy"
        },
        "native": "bind(name = \"android_ndk_for_testing\", actual = \"//:dummy\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android_sdk_for_testing",
            "actual": "@androidsdk//:files"
        },
        "native": "bind(name = \"android_sdk_for_testing\", actual = \"@androidsdk//:files\")"
    },
    {
        "original_rule_class": "local_repository",
        "original_attributes": {
            "name": "bazel_tools",
            "path": "/var/tmp/_bazel_jingwen/install/4365a5d9da52f10286a1a35b905c011f/_embedded_binaries/embedded_tools"
        },
        "native": "local_repository(name = \"bazel_tools\", path = __embedded_dir__ + \"/\" + \"embedded_tools\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "cc_toolchain",
            "actual": "@local_config_cc//:toolchain"
        },
        "native": "bind(name = \"cc_toolchain\", actual = \"@local_config_cc//:toolchain\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "databinding_annotation_processor",
            "actual": "@bazel_tools//tools/android:empty"
        },
        "native": "bind(name = \"databinding_annotation_processor\", actual = \"@bazel_tools//tools/android:empty\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "has_androidsdk",
            "actual": "@bazel_tools//tools/android:always_true"
        },
        "native": "bind(name = \"has_androidsdk\", actual = \"@bazel_tools//tools/android:always_true\")"
    },
    {
        "original_rule_class": "local_repository",
        "original_attributes": {
            "name": "rules_maven",
            "path": "."
        },
        "native": "local_repository(name = \"rules_maven\", path = \".\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "original_attributes": {
            "name": "bazel_skylib",
            "url": "https://github.com/bazelbuild/bazel-skylib/archive/0.6.0.tar.gz",
            "strip_prefix": "bazel-skylib-0.6.0"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "bcbe8795189e6710cb7ae8896a4d5248feb0b31df0efb322e8373861703a6e8a",
                "attributes": {
                    "url": "https://github.com/bazelbuild/bazel-skylib/archive/0.6.0.tar.gz",
                    "urls": [],
                    "sha256": "eb5c57e4c12e68c0c20bc774bfbc60a568e800d025557bc4ea022c6479acc867",
                    "strip_prefix": "bazel-skylib-0.6.0",
                    "type": "",
                    "build_file_content": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "workspace_file_content": "",
                    "name": "bazel_skylib"
                }
            }
        ]
    },
    {
        "original_rule_class": "@rules_maven//:coursier.bzl%coursier_fetch",
        "original_attributes": {
            "name": "maven",
            "repositories": [
                "https://bintray.com/bintray/jcenter",
                "https://maven.google.com",
                "https://repo1.maven.org/maven2"
            ],
            "artifacts": [
                "androidx.test.espresso:espresso-core:3.1.1",
                "androidx.test.ext:junit:1.1.0",
                "androidx.test:runner:1.1.1",
                "com.android.support:design:28.0.0",
                "com.google.android.gms:play-services-maps:16.0.0",
                "com.google.code.gson:gson:2.8.5",
                "com.google.guava:guava:27.0-android",
                "com.google.inject:guice:4.0",
                "commons-io:commons-io:2.6",
                "io.reactivex.rxjava2:rxjava:2.2.4",
                "junit:junit:4.12",
                "org.hamcrest:java-hamcrest:2.0.0.0",
                "org.mockito:mockito-core:2.22.0",
                "org.springframework:spring-core:5.1.3.RELEASE"
            ],
            "fetch_sources": True
        },
        "repositories": [
            {
                "rule_class": "@rules_maven//:coursier.bzl%coursier_fetch",
                "output_tree_hash": "560e78f8ff58a087c9f0d7999853c1308006f2175dbca17c5a139438f2784c7c",
                "attributes": {
                    "name": "maven",
                    "repositories": [
                        "https://bintray.com/bintray/jcenter",
                        "https://maven.google.com",
                        "https://repo1.maven.org/maven2"
                    ],
                    "artifacts": [
                        "androidx.test.espresso:espresso-core:3.1.1",
                        "androidx.test.ext:junit:1.1.0",
                        "androidx.test:runner:1.1.1",
                        "com.android.support:design:28.0.0",
                        "com.google.android.gms:play-services-maps:16.0.0",
                        "com.google.code.gson:gson:2.8.5",
                        "com.google.guava:guava:27.0-android",
                        "com.google.inject:guice:4.0",
                        "commons-io:commons-io:2.6",
                        "io.reactivex.rxjava2:rxjava:2.2.4",
                        "junit:junit:4.12",
                        "org.hamcrest:java-hamcrest:2.0.0.0",
                        "org.mockito:mockito-core:2.22.0",
                        "org.springframework:spring-core:5.1.3.RELEASE"
                    ],
                    "fetch_sources": True,
                    "checksums": {
                        "android.arch.core:common:1.1.1": {
                            "sha256": "3a616a32f433e9e23f556b38575c31b013613d3ae85206263b7625fe1f4c151a"
                        },
                        "android.arch.core:runtime:aar:1.1.1": {
                            "sha256": "c3215aa5873311b3f88a6f4e4a3c25ad89971bc127de8c3e1291c57f93a05c39"
                        },
                        "android.arch.lifecycle:common:1.1.1": {
                            "sha256": "8d378e88ebd5189e09eef623414812c868fd90aa519d6160e2311fb8b81cff56"
                        },
                        "android.arch.lifecycle:livedata-core:aar:1.1.1": {
                            "sha256": "d6fdd8b985d6178d7ea2f16986a24e83f1bee936b74d43167c69e08d3cc12c50"
                        },
                        "android.arch.lifecycle:livedata:aar:1.1.1": {
                            "sha256": "50ab0490c1ff1a7cfb4e554032998b080888946d0dd424f39900efc4a1bcd750"
                        },
                        "android.arch.lifecycle:runtime:aar:1.1.1": {
                            "sha256": "c4e4be66c1b2f0abec593571454e1de14013f7e0f96bf2a9f212931a48cae550"
                        },
                        "android.arch.lifecycle:viewmodel:aar:1.1.1": {
                            "sha256": "7de29cfaba77d6b5d5be234c57f6812d0150d087e63941af22ba1d1f8e2bc96a"
                        },
                        "androidx.annotation:annotation:1.0.0": {
                            "sha256": "0baae9755f7caf52aa80cd04324b91ba93af55d4d1d17dcc9a7b53d99ef7c016"
                        },
                        "androidx.lifecycle:lifecycle-common:2.0.0": {
                            "sha256": "7bad7a188804adea6fa1f35d5ef99b705f20bd93ecadde484760ff86b535fefc"
                        },
                        "androidx.test.espresso:espresso-core:3.1.1": {
                            "sha256": "5d5467544014b331299c7e6b21986096a43a8d88f7dde59d09171328c689e92c"
                        },
                        "androidx.test.espresso:espresso-idling-resource:3.1.1": {
                            "sha256": "624cfcf4321792bafab3d0b60f07283e8e0b0f50663bfa5d6e56c21225231e4e"
                        },
                        "androidx.test.ext:junit:1.1.0": {
                            "sha256": "8d4733213eeb8d071f969ea5b04f6559dc4e180cdc6fa9254aacdc14a3d3f4b7"
                        },
                        "androidx.test:core:1.1.0": {
                            "sha256": "fda5a08856ec82fc05e4dc37bd4eea93c9d02c231fd828d6b8ce2c6a42f79271"
                        },
                        "androidx.test:monitor:1.1.1": {
                            "sha256": "ecbc74d5eb4a004a676cc26b550ae94bd685a9088b84f6eea42bf320558af237"
                        },
                        "androidx.test:runner:1.1.1": {
                            "sha256": "b16842932ce0d59c57f6d809f84326acdf2386e1d69dbb4473f2e92bc49e185c"
                        },
                        "aopalliance:aopalliance:1.0": {
                            "sha256": "0addec670fedcd3f113c5c8091d783280d23f75e3acb841b61a9cdb079376a08"
                        },
                        "com.android.support:animated-vector-drawable:aar:28.0.0": {
                            "sha256": "271ecbc906cda8dcd9e655ba0473129c3408a4189c806f616c378e6fd18fb3b7"
                        },
                        "com.android.support:appcompat-v7:aar:28.0.0": {
                            "sha256": "a3a8e5230359746ed91801579b5fbe4668e3b1c4e6a14c7d67c8f58cb0311752"
                        },
                        "com.android.support:asynclayoutinflater:aar:28.0.0": {
                            "sha256": "115bde87721f7334579b0c735f60dd7c98af1bb7f34010c5b0553b95dc351aa2"
                        },
                        "com.android.support:cardview-v7:aar:28.0.0": {
                            "sha256": "bc9e6b0e06ce1205f1db34f0e6193019613d19cfeb54cdccea722340d1c60f26"
                        },
                        "com.android.support:collections:28.0.0": {
                            "sha256": "93c258c8a09f531a267653829742c0f8f6da0e348b11cb8655b0855628f2d4f0"
                        },
                        "com.android.support:coordinatorlayout:aar:28.0.0": {
                            "sha256": "9dfacd80423dc979048fbaed83c0ee543c46259feb2417377e79a656888d3892"
                        },
                        "com.android.support:cursoradapter:aar:28.0.0": {
                            "sha256": "87feffe742b8d62ca8a9833abe564838bf6a672e31c7ad1306ec4006adf90d21"
                        },
                        "com.android.support:customview:aar:28.0.0": {
                            "sha256": "98db03845f994e08248bf701c1ff0ccaa12e70f94251ec9272900f0f694e072b"
                        },
                        "com.android.support:design:28.0.0": {
                            "sha256": "7874ad1904eedc74aa41cffffb7f759d8990056f3bbbc9264911651c67c42f5f"
                        },
                        "com.android.support:documentfile:aar:28.0.0": {
                            "sha256": "47cdcd3e9302b7b064923f05487a5c03babbd9bbda4726b71e97791fab5d4779"
                        },
                        "com.android.support:drawerlayout:aar:28.0.0": {
                            "sha256": "8f6809afae4793550c37461c9810e954ae6a23dbb4d23e5333bf18148df1150a"
                        },
                        "com.android.support:interpolator:aar:28.0.0": {
                            "sha256": "7bc7ee86a0db39a4b51956f3e89842d2bd962118d57d779eb6ed6b34ba0677ea"
                        },
                        "com.android.support:loader:aar:28.0.0": {
                            "sha256": "920b85efd72dc33e915b0f88a883fe73b88483c6df8751a741e17611f2460341"
                        },
                        "com.android.support:localbroadcastmanager:aar:28.0.0": {
                            "sha256": "d287c823af5fdde72c099fcfc5f630efe9687af7a914343ae6fd92de32c8a806"
                        },
                        "com.android.support:print:aar:28.0.0": {
                            "sha256": "4be8a812d73e4a80e35b91ceae127def3f0bb9726bf3bc439aa0cc81503f5728"
                        },
                        "com.android.support:recyclerview-v7:aar:28.0.0": {
                            "sha256": "eb296414c1f6d4c7b522f69fe50588ea85297855db0e7806c24eb4f75409587d"
                        },
                        "com.android.support:slidingpanelayout:aar:28.0.0": {
                            "sha256": "d1d234f66a1b36a9aee9b94fa6c66f97128c0828078c8e889e9037ec898cd600"
                        },
                        "com.android.support:support-annotations:28.0.0": {
                            "sha256": "5d5b9414f02d3fa0ee7526b8d5ddae0da67c8ecc8c4d63ffa6cf91488a93b927"
                        },
                        "com.android.support:support-compat:28.0.0": {
                            "sha256": "e17e3b01dbea3f9ea1c86943292f903ca93d2231c6242e456e0b6a9c5817118a"
                        },
                        "com.android.support:support-core-ui:28.0.0": {
                            "sha256": "bbc7f65fc95649464733af373361532ab5f9f3b749c3badaa2bbf27e574b6c6f"
                        },
                        "com.android.support:support-core-utils:28.0.0": {
                            "sha256": "c81e1e98ca3cb2edae002c69cf35b22aec364b8cb2f1042c97e206eb5790ac41"
                        },
                        "com.android.support:support-fragment:28.0.0": {
                            "sha256": "3772fc738ada86824ba1a4b3f197c3dbd67b7ddcfe2c9db1de95ef2e3487a915"
                        },
                        "com.android.support:support-media-compat:26.1.0": {
                            "sha256": "9d8cee7cd40eff22ebdeb90c8e70f5ee96c5bd25cb2c3e3b3940e27285a3e98a"
                        },
                        "com.android.support:support-v4:aar:26.1.0": {
                            "sha256": "36d8385de1be7791231acb933b757198f97cb53bc7d046e8c4bc403d214caaca"
                        },
                        "com.android.support:support-vector-drawable:aar:28.0.0": {
                            "sha256": "f658986d968172bccfed28578471c96050780fe5e133861e4d331069cc373f4d"
                        },
                        "com.android.support:swiperefreshlayout:aar:28.0.0": {
                            "sha256": "a3b41f7f6730866b49865e86e49f988d4858699765f534300fb2ff5f9325e712"
                        },
                        "com.android.support:transition:aar:28.0.0": {
                            "sha256": "45d09fc51284c17bbab300f5122512ac7d7348a6d23bda2051648bbe76cc9aa5"
                        },
                        "com.android.support:versionedparcelable:aar:28.0.0": {
                            "sha256": "60eb1cb08f71b65c3f6123135e03ebeb5930b5e126e1e5b2ac91b386908c9d02"
                        },
                        "com.android.support:viewpager:aar:28.0.0": {
                            "sha256": "013c4c53058758ec104dbae970be58159f75dfe342ba8b937d15ff5282e35ffc"
                        },
                        "com.google.android.gms:play-services-base:aar:16.0.1": {
                            "sha256": "aca10c780c3219bc50f3db06734f4ab88badd3113c564c0a3156ff8ff674655b"
                        },
                        "com.google.android.gms:play-services-basement:aar:16.0.1": {
                            "sha256": "e08bfd1e87c4e50ef76161d7ac76b873aeb975367eeb3afa4abe62ea1887c7c6"
                        },
                        "com.google.android.gms:play-services-maps:16.0.0": {
                            "sha256": "07f59c5955b759ce7b80ceaeb8261643c5b79acc9f180df2b7c3987658eed2e8"
                        },
                        "com.google.android.gms:play-services-tasks:aar:16.0.1": {
                            "sha256": "b31c18d8d1cc8d9814f295ee7435471333f370ba5bd904ca14f8f2bec4f35c35"
                        },
                        "com.google.code.findbugs:jsr305:3.0.2": {
                            "sha256": "766ad2a0783f2687962c8ad74ceecc38a28b9f72a2d085ee438b7813e928d0c7"
                        },
                        "com.google.code.gson:gson:2.8.5": {
                            "sha256": "233a0149fc365c9f6edbd683cfe266b19bdc773be98eabdaf6b3c924b48e7d81"
                        },
                        "com.google.errorprone:error_prone_annotations:2.2.0": {
                            "sha256": "6ebd22ca1b9d8ec06d41de8d64e0596981d9607b42035f9ed374f9de271a481a"
                        },
                        "com.google.guava:failureaccess:1.0": {
                            "sha256": "d084bef9cd07a8537a1753e4850a69b7e8bab1d1e22e9f3a1e4826309a7a2336"
                        },
                        "com.google.guava:guava:27.0-android": {
                            "sha256": "9fcd95a6d27ce9309b68cfb92369192ae13498d5104a3367e6c64e3879215324"
                        },
                        "com.google.guava:listenablefuture:9999.0-empty-to-avoid-conflict-with-guava": {
                            "sha256": "b372a037d4230aa57fbeffdef30fd6123f9c0c2db85d0aced00c91b974f33f99"
                        },
                        "com.google.inject:guice:4.0": {
                            "sha256": "b378ffc35e7f7125b3c5f3a461d4591ae1685e3c781392f0c854ed7b7581d6d2"
                        },
                        "com.google.j2objc:j2objc-annotations:1.1": {
                            "sha256": "2994a7eb78f2710bd3d3bfb639b2c94e219cedac0d4d084d516e78c16dddecf6"
                        },
                        "com.squareup:javawriter:2.1.1": {
                            "sha256": "f699823d0081f69cbb676c1845ea222e0ada79bc88a53e5d22d8bd02d328f57e"
                        },
                        "commons-io:commons-io:2.6": {
                            "sha256": "f877d304660ac2a142f3865badfc971dec7ed73c747c7f8d5d2f5139ca736513"
                        },
                        "io.reactivex.rxjava2:rxjava:2.2.4": {
                            "sha256": "1ab516990561710cbda0b064675fa636c1ac497bee3f4c1a84ef00f0c707d57a"
                        },
                        "javax.inject:javax.inject:1": {
                            "sha256": "91c77044a50c481636c32d916fd89c9118a72195390452c81065080f957de7ff"
                        },
                        "junit:junit:4.12": {
                            "sha256": "59721f0805e223d84b90677887d9ff567dc534d7c502ca903c0c2b17f05c116a"
                        },
                        "net.bytebuddy:byte-buddy-agent:1.8.21": {
                            "sha256": "d1f4ef81ad9a54a99ac29788965afcc0aecb5c8d675aaeaca22ba2d5da7ac0a0"
                        },
                        "net.bytebuddy:byte-buddy:1.8.21": {
                            "sha256": "bf9121e29c855e69b4583ff98c1f7be3023b0207b27ec34dea8633be3361bd90"
                        },
                        "net.sf.kxml:kxml2:2.3.0": {
                            "sha256": "f264dd9f79a1fde10ce5ecc53221eff24be4c9331c830b7d52f2f08a7b633de2"
                        },
                        "org.checkerframework:checker-compat-qual:2.5.2": {
                            "sha256": "d7291cebf5e158d169807ae49d4b16ff672986f0c6d803e5f207c40cb61ef982"
                        },
                        "org.codehaus.mojo:animal-sniffer-annotations:1.17": {
                            "sha256": "92654f493ecfec52082e76354f0ebf87648dc3d5cec2e3c3cdb947c016747a53"
                        },
                        "org.hamcrest:hamcrest-core:1.3": {
                            "sha256": "66fdef91e9739348df7a096aa384a5685f4e875584cce89386a7a47251c4d8e9"
                        },
                        "org.hamcrest:hamcrest-integration:1.3": {
                            "sha256": "70f418efbb506c5155da5f9a5a33262ea08a9e4d7fea186aa9015c41a7224ac2"
                        },
                        "org.hamcrest:hamcrest-library:1.3": {
                            "sha256": "711d64522f9ec410983bd310934296da134be4254a125080a0416ec178dfad1c"
                        },
                        "org.hamcrest:java-hamcrest:2.0.0.0": {
                            "sha256": "09bc7044d57a497846e2480250e7a72ff3ae58efefc8c3a9ceecd0f4e092851c"
                        },
                        "org.mockito:mockito-core:2.22.0": {
                            "sha256": "e1d9058c1ccd05dbdad0c2d42b061679a625bcc71d5ef940f9bae64497d4e088"
                        },
                        "org.objenesis:objenesis:2.6": {
                            "sha256": "5e168368fbc250af3c79aa5fef0c3467a2d64e5a7bd74005f25d8399aeb0708d"
                        },
                        "org.reactivestreams:reactive-streams:1.0.2": {
                            "sha256": "cc09ab0b140e0d0496c2165d4b32ce24f4d6446c0a26c5dc77b06bdf99ee8fae"
                        },
                        "org.springframework:spring-core:5.1.3.RELEASE": {
                            "sha256": "b8fd57c892b03997c6e99cbb2b0cdd601e3d063b0ed99f09dc0b02e820a9ac61"
                        },
                        "org.springframework:spring-jcl:5.1.3.RELEASE": {
                            "sha256": "3f89f3bb318bf1f60777b376f187ef1d901834310e26e56024b6da7d00988f7f"
                        }
                    }
                }
            }
        ]
    },
    {
        "original_rule_class": "@rules_maven//:coursier.bzl%coursier_fetch",
        "original_attributes": {
            "name": "other_maven",
            "repositories": [
                "https://repo1.maven.org/maven2"
            ],
            "artifacts": [
                "com.google.guava:guava:27.0-jre"
            ],
            "fetch_sources": True
        },
        "repositories": [
            {
                "rule_class": "@rules_maven//:coursier.bzl%coursier_fetch",
                "output_tree_hash": "7deb726bd957280414f2bd18ad1b70741e58c67f25a9b39dba7a50704792f80a",
                "attributes": {
                    "name": "other_maven",
                    "repositories": [
                        "https://repo1.maven.org/maven2"
                    ],
                    "artifacts": [
                        "com.google.guava:guava:27.0-jre"
                    ],
                    "fetch_sources": True,
                    "checksums": {
                        "com.google.code.findbugs:jsr305:3.0.2": {
                            "sha256": "766ad2a0783f2687962c8ad74ceecc38a28b9f72a2d085ee438b7813e928d0c7"
                        },
                        "com.google.errorprone:error_prone_annotations:2.2.0": {
                            "sha256": "6ebd22ca1b9d8ec06d41de8d64e0596981d9607b42035f9ed374f9de271a481a"
                        },
                        "com.google.guava:failureaccess:1.0": {
                            "sha256": "d084bef9cd07a8537a1753e4850a69b7e8bab1d1e22e9f3a1e4826309a7a2336"
                        },
                        "com.google.guava:guava:27.0-jre": {
                            "sha256": "63b09db6861011e7fb2481be7790c7fd4b03f0bb884b3de2ecba8823ad19bf3f"
                        },
                        "com.google.guava:listenablefuture:9999.0-empty-to-avoid-conflict-with-guava": {
                            "sha256": "b372a037d4230aa57fbeffdef30fd6123f9c0c2db85d0aced00c91b974f33f99"
                        },
                        "com.google.j2objc:j2objc-annotations:1.1": {
                            "sha256": "2994a7eb78f2710bd3d3bfb639b2c94e219cedac0d4d084d516e78c16dddecf6"
                        },
                        "org.checkerframework:checker-qual:2.5.2": {
                            "sha256": "64b02691c8b9d4e7700f8ee2e742dce7ea2c6e81e662b7522c9ee3bf568c040a"
                        },
                        "org.codehaus.mojo:animal-sniffer-annotations:1.17": {
                            "sha256": "92654f493ecfec52082e76354f0ebf87648dc3d5cec2e3c3cdb947c016747a53"
                        }
                    }
                }
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "bootclasspath",
            "actual": "@local_jdk//:bootclasspath"
        },
        "native": "bind(name = \"bootclasspath\", actual = \"@local_jdk//:bootclasspath\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "extclasspath",
            "actual": "@local_jdk//:extdir"
        },
        "native": "bind(name = \"extclasspath\", actual = \"@local_jdk//:extdir\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "extdir",
            "actual": "@local_jdk//:extdir"
        },
        "native": "bind(name = \"extdir\", actual = \"@local_jdk//:extdir\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jar",
            "actual": "@local_jdk//:jar"
        },
        "native": "bind(name = \"jar\", actual = \"@local_jdk//:jar\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "java",
            "actual": "@local_jdk//:java"
        },
        "native": "bind(name = \"java\", actual = \"@local_jdk//:java\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "javac",
            "actual": "@local_jdk//:javac"
        },
        "native": "bind(name = \"javac\", actual = \"@local_jdk//:javac\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jdk",
            "actual": "@local_jdk//:jdk"
        },
        "native": "bind(name = \"jdk\", actual = \"@local_jdk//:jdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jdk-default",
            "actual": "@local_jdk//:jdk"
        },
        "native": "bind(name = \"jdk-default\", actual = \"@local_jdk//:jdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_header",
            "actual": "@local_jdk//:jni_header"
        },
        "native": "bind(name = \"jni_header\", actual = \"@local_jdk//:jni_header\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-darwin",
            "actual": "@local_jdk//:jni_md_header-darwin"
        },
        "native": "bind(name = \"jni_md_header-darwin\", actual = \"@local_jdk//:jni_md_header-darwin\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-freebsd",
            "actual": "@local_jdk//:jni_md_header-freebsd"
        },
        "native": "bind(name = \"jni_md_header-freebsd\", actual = \"@local_jdk//:jni_md_header-freebsd\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-linux",
            "actual": "@local_jdk//:jni_md_header-linux"
        },
        "native": "bind(name = \"jni_md_header-linux\", actual = \"@local_jdk//:jni_md_header-linux\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jre",
            "actual": "@local_jdk//:jre"
        },
        "native": "bind(name = \"jre\", actual = \"@local_jdk//:jre\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jre-default",
            "actual": "@local_jdk//:jre"
        },
        "native": "bind(name = \"jre-default\", actual = \"@local_jdk//:jre\")"
    },
    {
        "original_rule_class": "new_local_repository",
        "original_attributes": {
            "name": "local_jdk",
            "path": "/Library/Java/JavaVirtualMachines/jdk-10-latest/Contents/Home",
            "build_file": "/var/tmp/_bazel_jingwen/install/4365a5d9da52f10286a1a35b905c011f/_embedded_binaries/jdk.BUILD"
        },
        "native": "new_local_repository(name = \"local_jdk\", path = \"/Library/Java/JavaVirtualMachines/jdk-10-latest/Contents/Home\", build_file = __embedded_dir__ + \"/\" + \"jdk.BUILD\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "original_attributes": {
            "name": "remotejdk10_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-linux_x64-allmodules.tar.gz"
            ],
            "sha256": "57fad3602e74c79587901d6966d3b54ef32cb811829a2552163185d5064fe9b5",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-linux_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "d1ca659b67cee445ada6b739df181384effb08c36cc029ce5b8dc54675674a29",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-linux_x64-allmodules.tar.gz"
                    ],
                    "sha256": "57fad3602e74c79587901d6966d3b54ef32cb811829a2552163185d5064fe9b5",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-linux_x64-allmodules",
                    "type": "",
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "workspace_file_content": "",
                    "name": "remotejdk10_linux"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "original_attributes": {
            "name": "remotejdk10_linux_aarch64",
            "urls": [
                "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz",
                "http://openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz"
            ],
            "sha256": "b7098b7aaf6ee1ffd4a2d0371a0be26c5a5c87f6aebbe46fe9a92c90583a84be",
            "strip_prefix": "jdk10-server-release-1804",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "3d6e09ab6b822a3097da3c2428a09a559cbacdcc9875520370de78a1c9a459a5",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz",
                        "http://openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz"
                    ],
                    "sha256": "b7098b7aaf6ee1ffd4a2d0371a0be26c5a5c87f6aebbe46fe9a92c90583a84be",
                    "strip_prefix": "jdk10-server-release-1804",
                    "type": "",
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "workspace_file_content": "",
                    "name": "remotejdk10_linux_aarch64"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "original_attributes": {
            "name": "remotejdk10_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-macosx_x64-allmodules.tar.gz"
            ],
            "sha256": "e669c9a897413d855b550b4e39d79614392e6fb96f494e8ef99a34297d9d85d3",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-macosx_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "a19ce35fbbd38aa18f97419b0fbf8e3769d210a7e92e23a4301fb3dd443f8bc5",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-macosx_x64-allmodules.tar.gz"
                    ],
                    "sha256": "e669c9a897413d855b550b4e39d79614392e6fb96f494e8ef99a34297d9d85d3",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-macosx_x64-allmodules",
                    "type": "",
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "workspace_file_content": "",
                    "name": "remotejdk10_macos"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "original_attributes": {
            "name": "remotejdk10_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-win_x64-allmodules.zip"
            ],
            "sha256": "c39e7700a8d41794d60985df5a20352435196e78ecbc6a2b30df7be8637bffd5",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-win_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "1cf0f0a5365a00edf5bec7d21cdaa2583d43edb0528194d794b924ffcf97a20e",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-win_x64-allmodules.zip"
                    ],
                    "sha256": "c39e7700a8d41794d60985df5a20352435196e78ecbc6a2b30df7be8637bffd5",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-win_x64-allmodules",
                    "type": "",
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "workspace_file_content": "",
                    "name": "remotejdk10_win"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "original_attributes": {
            "name": "remotejdk_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules.tar.gz"
            ],
            "sha256": "f27cb933de4f9e7fe9a703486cf44c84bc8e9f138be0c270c9e5716a32367e87",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "522b8842c3131112d4b8f6410fd16af6a7c5c142d2e8ec229f7bb8445544fe21",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules.tar.gz"
                    ],
                    "sha256": "f27cb933de4f9e7fe9a703486cf44c84bc8e9f138be0c270c9e5716a32367e87",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules",
                    "type": "",
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "workspace_file_content": "",
                    "name": "remotejdk_linux"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "original_attributes": {
            "name": "remotejdk_linux_aarch64",
            "urls": [
                "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz",
                "http://openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz"
            ],
            "sha256": "72e7843902b0395e2d30e1e9ad2a5f05f36a4bc62529828bcbc698d54aec6022",
            "strip_prefix": "jdk9-server-release-1708",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "9574e42a20845620027c5541fd10db70e6eb81966052b38eb68e97fe1a44313a",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz",
                        "http://openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz"
                    ],
                    "sha256": "72e7843902b0395e2d30e1e9ad2a5f05f36a4bc62529828bcbc698d54aec6022",
                    "strip_prefix": "jdk9-server-release-1708",
                    "type": "",
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "workspace_file_content": "",
                    "name": "remotejdk_linux_aarch64"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "original_attributes": {
            "name": "remotejdk_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules.tar.gz"
            ],
            "sha256": "404e7058ff91f956612f47705efbee8e175a38b505fb1b52d8c1ea98718683de",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "d4b2e4eac7d03903d653b6e22785be259a583c3ba6b672ce7b660d93ba57476a",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules.tar.gz"
                    ],
                    "sha256": "404e7058ff91f956612f47705efbee8e175a38b505fb1b52d8c1ea98718683de",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules",
                    "type": "",
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "workspace_file_content": "",
                    "name": "remotejdk_macos"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "original_attributes": {
            "name": "remotejdk_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-win_x64-allmodules.zip"
            ],
            "sha256": "e738829017f107e7a7cd5069db979398ec3c3f03ef56122f89ba38e7374f63ed",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-win_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "64ced431d2e95ae15eced741bffa4de5c39aaaca07e10a872ba24b2ecfeca8e0",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-win_x64-allmodules.zip"
                    ],
                    "sha256": "e738829017f107e7a7cd5069db979398ec3c3f03ef56122f89ba38e7374f63ed",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-win_x64-allmodules",
                    "type": "",
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "workspace_file_content": "",
                    "name": "remotejdk_win"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf",
        "original_attributes": {
            "name": "local_config_cc"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf",
                "output_tree_hash": "174dc01f5f7319d6050b68416ab243d699962905758b0e0ca2d794c2197a542b",
                "attributes": {
                    "name": "local_config_cc"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/osx:xcode_configure.bzl%xcode_autoconf",
        "original_attributes": {
            "name": "local_config_xcode",
            "xcode_locator": "@bazel_tools//tools/osx:xcode_locator.m"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/osx:xcode_configure.bzl%xcode_autoconf",
                "output_tree_hash": "5fe0f1c42b5d9b2860acc0c26adb1e0b2133af1934ec5115519c82b1dc6e2e1a",
                "attributes": {
                    "name": "local_config_xcode",
                    "xcode_locator": "@bazel_tools//tools/osx:xcode_locator.m"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/sh:sh_configure.bzl%sh_config",
        "original_attributes": {
            "name": "local_config_sh"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/sh:sh_configure.bzl%sh_config",
                "output_tree_hash": "1791df6e2b2acbadca9754852d88516517eb174964bd9c5aa626d2cdee00f593",
                "attributes": {
                    "name": "local_config_sh"
                }
            }
        ]
    }
]