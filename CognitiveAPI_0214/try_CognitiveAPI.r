### source : https://github.com/c3h3/cognitiveR/blob/master/bin/tryIt.R

### Try Web Language Model ###
install.packages(c("devtools"))
library(devtools)

install_github("c3h3/cognitiveR") 
library(cognitiveR)
library(dplyr)

#不能有標點符號 可以有空白
apiKey = ""
webML.lsModels(apiKey)
result = webML.breakIntoWords(apiKey, model = "body", text = "閉鎖性粉刺是許多朋友們的困擾它不像黑頭粉刺相對容易移除而且常常會擔心若不處理可能進一步成為囊腫型的青春痘然而網路上一大堆處理閉鎖性粉刺的偏方卻讓醫師們常常看了膽顫心驚所以這次針對閉鎖性粉刺特別寫一篇文章並著重在實際處理方式的介紹")
result[[1]][[1]]

bind_rows(result) #result : list of list
do.call(bind_rows, result)

bind_rows(result[[1]]) #result[[1]] : list of dataframe

### Try sentiment ###
apiKey = ''
result = sentiment.getScores(apiKey,
                    list(lang="en", id="", text= "nice, it's perfect!"),
                    list(lang="en", id="", text= "Very  bad hotel, room was very bad smells,  shower was very bad from now I never go to westbetern hotels."))
result[[1]][[1]]
bind_rows(result[[1]]) 

### Try KeyPhrases ###
result = keyPhrases.getKeyPhrases(apiKey,
                         list(lang="ja", id="", text= " 俳優の故・三船敏郎さんが米ハリウッドの殿堂「ウォーク・オブ・フェーム」（名声の歩道）入りする記念式典が１４日、ロサンゼルスで開かれ、三船さんの名前入りの星形プレートが披露された。三船さんは、黒澤明監督の「七人の侍」などで、世界的に有名になった。
                              地元メディアによると、殿堂入りは２５９４番目。日本関係者は、米国で活躍した俳優の早川雪洲さん、マコ岩松さんのほか、怪獣ゴジラが選ばれている。今回の式典には、三船さんの親族らが出席した。
                              三船さんは１９９７年に７７歳でなくなるまで、「用心棒」「赤ひげ」「羅生門」など生涯で１５０本以上の映画に出演。国際的スターとなり、「世界で最も知られた日本人俳優」と評価された。（平山亜理） ") )

data.frame(bind_rows(result[[1]][[1]][1]),result[[1]][[1]][2])

