package service;

import model.UserForm;
import model.Word;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import repository.WordRepository;

@Service
public class WordService {
@Autowired
    ParseDict parseDict;
@Autowired
    WordRepository wordRepository;
    public void addWord(Word word, ModelMap map) {
        if(parseDict.CheckWordFromDictionar(word.getWord())) {

            if(wordRepository.findByWord(word.getWord().toLowerCase())==null ) {


                if (parseDict.CheckWordWitchLastWord(word.getWord())) {
                    word.setWord(word.getWord().toLowerCase());
                    wordRepository.save(word);
                } else
                    map.addAttribute("message", "The first letter of the word is not the same as the last letter of the last word!");
            }else {
                map.addAttribute("message", "Word is alredy exists!");

            }
        }else {
            map.addAttribute("message", "Word does't exist!");
        }
    }
}
