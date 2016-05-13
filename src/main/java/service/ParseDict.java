package service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import jdk.nashorn.api.scripting.URLReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.WordRepository;

import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by hp on 12.05.2016.
 */
@Service
public class ParseDict {
    @Autowired
   WordRepository wordRepository;


    public boolean CheckWordFromDictionar(String word) {
        JsonParser parser = new JsonParser();
        JsonElement element;
        try {
            element = parser.parse(new URLReader(new URL("https://dictionary.yandex.net/api/v1/dicservice.json/lo" +
                    "okup?key=dict.1.1.20160512T184925Z.e0025dc3e5cb56dc.e6eb0478ea018020bc18a45" +
                    "4a3d5befeb4b77c34&lang=en-en&text=" + word)));
            JsonArray array = element.getAsJsonObject().getAsJsonArray("def");
            return array.size() == 0 ? false : true;
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
return false;
    }
    public boolean CheckWordWitchLastWord(String word){
        if(wordRepository.findByMaxId()!=null) {
            if (wordRepository.findByMaxId().getWord().charAt(wordRepository.findByMaxId().getWord().length() - 1) == word.charAt(0)) {
                return true;
            }
            else return false;
        }
        return true;
    }
}
