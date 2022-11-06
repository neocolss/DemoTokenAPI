package examples.tokens;

import com.intuit.karate.junit5.Karate;

public class TokensRunner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("createTokens").relativeTo(getClass());
    }
}
