package androidx.constraintlayout.core.parser;

/* JADX INFO: loaded from: classes.dex */
public class CLParser {
    static boolean sDebug = false;
    private String mContent;
    private boolean mHasComment = false;
    private int mLineNumber;

    enum TYPE {
        UNKNOWN,
        OBJECT,
        ARRAY,
        NUMBER,
        STRING,
        KEY,
        TOKEN
    }

    public static CLObject parse(String string) throws CLParsingException {
        return new CLParser(string).parse();
    }

    public CLParser(String content) {
        this.mContent = content;
    }

    /* JADX WARN: Code duplicated, block: B:110:0x0055 A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:111:0x00d1 A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:25:0x005a  */
    /* JADX WARN: Code duplicated, block: B:27:0x0060  */
    /* JADX WARN: Code duplicated, block: B:28:0x0069  */
    /* JADX WARN: Code duplicated, block: B:30:0x006f A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:31:0x0071  */
    /* JADX WARN: Code duplicated, block: B:32:0x007c  */
    /* JADX WARN: Code duplicated, block: B:33:0x0085  */
    /* JADX WARN: Code duplicated, block: B:35:0x008b A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:36:0x008d  */
    /* JADX WARN: Code duplicated, block: B:37:0x0098  */
    /* JADX WARN: Code duplicated, block: B:38:0x00a1  */
    /* JADX WARN: Code duplicated, block: B:40:0x00a7  */
    /* JADX WARN: Code duplicated, block: B:42:0x00ae  */
    /* JADX WARN: Code duplicated, block: B:44:0x00bf  */
    /* JADX WARN: Code duplicated, block: B:46:0x00c3  */
    /* JADX WARN: Code duplicated, block: B:51:0x00fa  */
    /* JADX WARN: Code duplicated, block: B:80:0x014d  */
    /* JADX WARN: Code duplicated, block: B:82:0x015b  */
    public CLObject parse() throws CLParsingException {
        char ck;
        CLToken token;
        char[] content = this.mContent.toCharArray();
        int length = content.length;
        int i = 1;
        this.mLineNumber = 1;
        int startIndex = -1;
        for (int i2 = 0; i2 < length; i2++) {
            char c = content[i2];
            if (c == '{') {
                startIndex = i2;
                break;
            }
            if (c == '\n') {
                this.mLineNumber++;
            }
        }
        if (startIndex == -1) {
            throw new CLParsingException("invalid json content", null);
        }
        CLObject root = CLObject.allocate(content);
        root.setLine(this.mLineNumber);
        root.setStart(startIndex);
        CLElement currentElement = root;
        int i3 = startIndex + 1;
        while (i3 < length) {
            char c2 = content[i3];
            if (c2 == '\n') {
                this.mLineNumber += i;
            }
            if (this.mHasComment) {
                if (c2 == '\n') {
                    this.mHasComment = false;
                    if (currentElement == null) {
                        break;
                        break;
                    }
                    if (currentElement.isDone()) {
                        currentElement = getNextJsonElement(i3, c2, currentElement, content);
                        i = i;
                        startIndex = startIndex;
                    } else if (currentElement instanceof CLObject) {
                        if (c2 == '}') {
                            currentElement.setEnd(i3 - 1);
                            i = i;
                            startIndex = startIndex;
                        } else {
                            currentElement = getNextJsonElement(i3, c2, currentElement, content);
                            i = i;
                            startIndex = startIndex;
                        }
                    } else if (currentElement instanceof CLArray) {
                        if (c2 == ']') {
                            currentElement.setEnd(i3 - 1);
                            i = i;
                            startIndex = startIndex;
                        } else {
                            currentElement = getNextJsonElement(i3, c2, currentElement, content);
                            i = i;
                            startIndex = startIndex;
                        }
                    } else if (currentElement instanceof CLString) {
                        if (content[(int) currentElement.mStart] == c2) {
                            currentElement.setStart(currentElement.mStart + 1);
                            currentElement.setEnd(i3 - 1);
                        }
                        i = i;
                        startIndex = startIndex;
                    } else {
                        if (currentElement instanceof CLToken) {
                            token = (CLToken) currentElement;
                            if (!token.validate(c2, i3)) {
                                throw new CLParsingException("parsing incorrect token " + token.content() + " at line " + this.mLineNumber, token);
                            }
                        }
                        if (!(currentElement instanceof CLKey)) {
                            currentElement.setStart(currentElement.mStart + 1);
                            currentElement.setEnd(i3 - 1);
                        } else {
                            currentElement.setStart(currentElement.mStart + 1);
                            currentElement.setEnd(i3 - 1);
                        }
                        if (!currentElement.isDone()) {
                            currentElement.setEnd(i3 - 1);
                            if (c2 != '}') {
                                currentElement = currentElement.getContainer();
                                currentElement.setEnd(i3 - 1);
                                if (currentElement instanceof CLKey) {
                                    currentElement = currentElement.getContainer();
                                    currentElement.setEnd(i3 - 1);
                                }
                            } else {
                                currentElement = currentElement.getContainer();
                                currentElement.setEnd(i3 - 1);
                                if (currentElement instanceof CLKey) {
                                    currentElement = currentElement.getContainer();
                                    currentElement.setEnd(i3 - 1);
                                }
                            }
                        }
                    }
                    if (!currentElement.isDone()) {
                    }
                } else {
                    i = i;
                    startIndex = startIndex;
                }
            } else {
                if (currentElement == null) {
                    break;
                }
                if (currentElement.isDone()) {
                    currentElement = getNextJsonElement(i3, c2, currentElement, content);
                    i = i;
                    startIndex = startIndex;
                } else if (currentElement instanceof CLObject) {
                    if (c2 == '}') {
                        currentElement.setEnd(i3 - 1);
                        i = i;
                        startIndex = startIndex;
                    } else {
                        currentElement = getNextJsonElement(i3, c2, currentElement, content);
                        i = i;
                        startIndex = startIndex;
                    }
                } else if (currentElement instanceof CLArray) {
                    if (c2 == ']') {
                        currentElement.setEnd(i3 - 1);
                        i = i;
                        startIndex = startIndex;
                    } else {
                        currentElement = getNextJsonElement(i3, c2, currentElement, content);
                        i = i;
                        startIndex = startIndex;
                    }
                } else if (currentElement instanceof CLString) {
                    if (content[(int) currentElement.mStart] == c2) {
                        currentElement.setStart(currentElement.mStart + 1);
                        currentElement.setEnd(i3 - 1);
                    }
                    i = i;
                    startIndex = startIndex;
                } else {
                    if (currentElement instanceof CLToken) {
                        token = (CLToken) currentElement;
                        if (!token.validate(c2, i3)) {
                            throw new CLParsingException("parsing incorrect token " + token.content() + " at line " + this.mLineNumber, token);
                        }
                    }
                    if ((!(currentElement instanceof CLKey) || (currentElement instanceof CLString)) && (((ck = content[(int) currentElement.mStart]) == '\'' || ck == '\"') && ck == c2)) {
                        currentElement.setStart(currentElement.mStart + 1);
                        currentElement.setEnd(i3 - 1);
                    }
                    if (!currentElement.isDone() && (c2 == '}' || c2 == ']' || c2 == ',' || c2 == ' ' || c2 == '\t' || c2 == '\r' || c2 == '\n' || c2 == ':')) {
                        currentElement.setEnd(i3 - 1);
                        if (c2 != '}' || c2 == ']') {
                            currentElement = currentElement.getContainer();
                            currentElement.setEnd(i3 - 1);
                            if (currentElement instanceof CLKey) {
                                currentElement = currentElement.getContainer();
                                currentElement.setEnd(i3 - 1);
                            }
                        }
                    }
                }
                if (!currentElement.isDone() && (!(currentElement instanceof CLKey) || ((CLKey) currentElement).mElements.size() > 0)) {
                    currentElement = currentElement.getContainer();
                }
            }
            i3++;
            i = i;
            startIndex = startIndex;
        }
        while (currentElement != null && !currentElement.isDone()) {
            if (currentElement instanceof CLString) {
                currentElement.setStart(((int) currentElement.mStart) + i);
            }
            currentElement.setEnd(length - 1);
            currentElement = currentElement.getContainer();
        }
        if (sDebug) {
            System.out.println("Root: " + root.toJSON());
        }
        return root;
    }

    private CLElement getNextJsonElement(int position, char c, CLElement currentElement, char[] content) throws CLParsingException {
        CLElement currentElement2;
        switch (c) {
            case '\t':
            case '\n':
            case '\r':
            case ' ':
            case ',':
            case ':':
                currentElement2 = currentElement;
                break;
            case '\"':
            case '\'':
                return currentElement instanceof CLObject ? createElement(currentElement, position, TYPE.KEY, true, content) : createElement(currentElement, position, TYPE.STRING, true, content);
            case '+':
            case '-':
            case '.':
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                return createElement(currentElement, position, TYPE.NUMBER, true, content);
            case '/':
                currentElement2 = currentElement;
                if (position + 1 < content.length && content[position + 1] == '/') {
                    this.mHasComment = true;
                }
                break;
            case '[':
                return createElement(currentElement, position, TYPE.ARRAY, true, content);
            case ']':
            case '}':
                currentElement.setEnd(position - 1);
                CLElement currentElement3 = currentElement.getContainer();
                currentElement3.setEnd(position);
                return currentElement3;
            case '{':
                return createElement(currentElement, position, TYPE.OBJECT, true, content);
            default:
                if (!(currentElement instanceof CLContainer) || (currentElement instanceof CLObject)) {
                    return createElement(currentElement, position, TYPE.KEY, true, content);
                }
                CLElement currentElement4 = createElement(currentElement, position, TYPE.TOKEN, true, content);
                CLToken token = (CLToken) currentElement4;
                if (!token.validate(c, position)) {
                    throw new CLParsingException("incorrect token <" + c + "> at line " + this.mLineNumber, token);
                }
                return currentElement4;
        }
        return currentElement2;
    }

    private CLElement createElement(CLElement currentElement, int position, TYPE type, boolean applyStart, char[] content) {
        CLElement newElement = null;
        if (sDebug) {
            System.out.println("CREATE " + type + " at " + content[position]);
        }
        switch (type.ordinal()) {
            case 1:
                newElement = CLObject.allocate(content);
                position++;
                break;
            case 2:
                newElement = CLArray.allocate(content);
                position++;
                break;
            case 3:
                newElement = CLNumber.allocate(content);
                break;
            case 4:
                newElement = CLString.allocate(content);
                break;
            case 5:
                newElement = CLKey.allocate(content);
                break;
            case 6:
                newElement = CLToken.allocate(content);
                break;
        }
        if (newElement == null) {
            return null;
        }
        newElement.setLine(this.mLineNumber);
        if (applyStart) {
            newElement.setStart(position);
        }
        if (currentElement instanceof CLContainer) {
            CLContainer container = (CLContainer) currentElement;
            newElement.setContainer(container);
        }
        return newElement;
    }
}
