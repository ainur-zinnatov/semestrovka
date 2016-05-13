package controllers;

import aspects.AnnoLogging;
import model.Room;
import model.UserForm;
import model.UserLogin;
import model.Word;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import repository.RoomRepository;
import repository.WordRepository;
import service.ParseDict;
import service.WordService;

import java.util.Objects;


@Controller
public class MyController {
    @Autowired
ParseDict parseDict;
    @Autowired
    RoomRepository roomRepository;
@Autowired
    WordRepository wordRepository;
    @Autowired
    WordService wordService;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String viewIdea(ModelMap map) {
        map.addAttribute("user", new UserForm());
        map.addAttribute("loginForm", new UserLogin());
        map.addAttribute("modal_visible",false);
        return "index";
    }




    //default page size
    private static final int DEFAULT_PAGE_SIZE = 5;
    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(value = "/game", method = RequestMethod.GET)
    public String game_g(
            @RequestParam(defaultValue = "1") Integer p,        //page number
            @RequestParam(defaultValue = "desc") String s,      //sorting by desc or asc
            ModelMap map,
            Pageable pageable
    ) {
        Page<Word> words;
        //Page<Post> posts = postService.getPostPageSortedByTypes(t, p - 1, s);
        words = wordRepository.findAll(new PageRequest(p-1, DEFAULT_PAGE_SIZE, Sort.Direction.DESC, "id"));
        int current = words.getNumber() + 1;
        int begin = Math.max(1, current - 5);
        int end = Math.min(begin + 10, words.getTotalPages());
        map.addAttribute("word", new Word());

        map.addAttribute("message", wordRepository.findByMaxId().getWord());

        map.addAttribute("page", words);
        map.addAttribute("current", current);
        map.addAttribute("begin", begin);
        map.addAttribute("end", end);
        return "register";
    }


    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(value = "/game", method = RequestMethod.POST)
    public String game_p(
        RedirectAttributes redirectAttributes,
        @Validated Word word,
        BindingResult result,
                       @RequestParam(defaultValue = "1") Integer p,        //page number
                       @RequestParam(defaultValue = "desc") String s,      //sorting by desc or asc
                       ModelMap map,
                       Pageable pageable

        ){


            if (result.hasErrors()) {
                map.addAttribute("message", "internal error");
                Page<Word> words;

                words = wordRepository.findAll(new PageRequest(p-1, DEFAULT_PAGE_SIZE, Sort.Direction.DESC, "id"));
                map.addAttribute("word", new Word());

                map.addAttribute("page", words);
                return "register";


            } else {
                map.addAttribute("message", word.getWord());

                word.addRoom(roomRepository.findByName("test"));
                wordService.addWord(word,map);
                Page<Word> words;

                words = wordRepository.findAll(new PageRequest(p-1, DEFAULT_PAGE_SIZE, Sort.Direction.DESC, "id"));

                int current = words.getNumber() + 1;
                int begin = Math.max(1, current - 5);
                int end = Math.min(begin + 10, words.getTotalPages());

                map.addAttribute("word", new Word());

                map.addAttribute("page", words);
                map.addAttribute("current", current);
                map.addAttribute("begin", begin);
                map.addAttribute("end", end);
                return "register";
            }

        }
    }
